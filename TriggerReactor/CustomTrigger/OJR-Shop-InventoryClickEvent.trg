IMPORT org.bukkit.Bukkit
IMPORT java.io.File
IMPORT org.bukkit.configuration.file.YamlConfiguration

inventory = event.getInventory()

// 서버 버전 체크
serverVersionName = Bukkit.getBukkitVersion()
serverVersionString = serverVersionName.split("-")
serverversion = parseInt(serverVersionString[0].replace(".", ""))
IF serverversion > 1122
	inventoryName = event.getView().getTitle()
	redGlass = item("RED_STAINED_GLASS_PANE", 1)
ELSE
	inventoryName = inventory.getName()
	redGlass = item("STAINED_GLASS_PANE", 1, 14)
ENDIF

IF inventoryName.contains("§r§r§r§r§r")
	event.setCancelled(true)
	
	IF event.getClickedInventory() == null
		#STOP
	ENDIF
	IF event.getClickedInventory().getType().toString().equals("PLAYER")
		#STOP
	ENDIF
	
	configFile = File("./plugins/TriggerReactor/config-shop.yml")
	configYml = YamlConfiguration.loadConfiguration(configFile)
	shopId = inventoryName.substring(0, inventoryName.indexOf("§r§r§r§r§r")).replaceAll("§", "")
	shopName = configYml.get("shopList."+shopId+".shopName")
	player = event.getWhoClicked()
	slot = event.getSlot()
	file = File("./plugins/TriggerReactor/ShopTrigger/"+shopName+".yml")
	yml = YamlConfiguration.loadConfiguration(file)
	shopPage = 1
	IF inventory.getItem(52) != null
		shopPage = inventory.getItem(52).getAmount()-1
	ELSEIF inventory.getItem(46) != null
		shopPage = inventory.getItem(46).getAmount()+1
	ENDIF
	
	IF slot < 45
		FOR i = 0:45
			item = inventory.getItem(i)
			IF item != null && item.getItemMeta().getLore() == null
				#STOP
			ENDIF
		ENDFOR
		IF yml.get("shopItems."+((shopPage-1)*45+slot)) != null
			itemAmount = event.getCurrentItem().getAmount()
			item = yml.get("shopItems."+((shopPage-1)*45+slot)+".item")
			click = event.getClick().toString()
			IF click == "LEFT"
				itemBuy = yml.get("shopItems."+((shopPage-1)*45+slot)+".buy") * itemAmount
				IF itemBuy > $money
					player.sendMessage(color("&f[&bTR&f] &c소지금이 부족합니다"))
					ASYNC
						index = slot
						inv = inventory
						originItem = inv.getItem(index)
						warningItem = redGlass
						setItemTitle(warningItem, "&c소지금 부족")
						
						inv.setItem(index, warningItem)
						newInstance("java.lang.Thread").sleep(500)
						inv.setItem(index, originItem)
					ENDASYNC
				ELSEIF $emptyslot == -1
					player.sendMessage(color("&f[&bTR&f] &c인벤토리가 가득 차있습니다"))
					ASYNC
						index = slot
						inv = inventory
						originItem = inv.getItem(index)
						warningItem = redGlass
						setItemTitle(warningItem, "&c인벤토리 부족")
						
						inv.setItem(index, warningItem)
						newInstance("java.lang.Thread").sleep(500)
						inv.setItem(index, originItem)
					ENDASYNC
				ELSEIF yml.get("shopItems."+((shopPage-1)*45+slot)+".buy") == -1
					player.sendMessage(color("&f[&bTR&f] &c구매가 불가능한 상품입니다"))
					ASYNC
						index = slot
						inv = inventory
						originItem = inv.getItem(index)
						warningItem = redGlass
						setItemTitle(warningItem, "&c구매불가")
						
						inv.setItem(index, warningItem)
						newInstance("java.lang.Thread").sleep(500)
						inv.setItem(index, originItem)
					ENDASYNC
				ELSE
					vault.take(player, itemBuy)
					itemMeta = item.getItemMeta()
					lore = itemMeta.getLore()
					newLore = list()
					IF lore == null
						loreCount = 0
					ELSE
						loreCount = lore.size()
					ENDIF
					FOR i = 0:(loreCount-4)
						newLore.add(lore.get(i))
					ENDFOR
					itemMeta.setLore(newLore)
					item.setItemMeta(itemMeta)
					item.setAmount(itemAmount)
					player.getInventory().addItem(item)
					itemName = item.getType().toString()
					IF item.getItemMeta().getDisplayName() != null
						itemName = item.getItemMeta().getDisplayName()
					ENDIF
					playerHead = inventory.getItem(49)
					setLore(playerHead, 0, "&6잔고: &c"+vault.balance(player)+"&6원")
					player.sendMessage(color("&f[&bTR&f] &f"+itemName+" &6"+item.getAmount()+"&7개를 &6"+itemBuy+"&7원에 구매 하였습니다"))
				ENDIF
			ELSEIF click == "RIGHT"
				itemSell = yml.get("shopItems."+((shopPage-1)*45+slot)+".sell") * itemAmount
				item.setAmount(itemAmount)
				itemName = item.getType().toString()
				IF item.getItemMeta().getDisplayName() != null
					itemName = item.getItemMeta().getDisplayName()
				ENDIF
				IF yml.get("shopItems."+((shopPage-1)*45+slot)+".sell") == -1
					player.sendMessage(color("&f[&bTR&f] &c판매가 불가능한 상품입니다"))
					ASYNC
						index = slot
						inv = inventory
						originItem = inv.getItem(index)
						warningItem = redGlass
						setItemTitle(warningItem, "&c판매불가")
						
						inv.setItem(index, warningItem)
						newInstance("java.lang.Thread").sleep(500)
						inv.setItem(index, originItem)
					ENDASYNC
				ELSEIF player.getInventory().containsAtLeast(item, itemAmount)
					player.getInventory().removeItem(item)
					vault.give(player, itemSell)
					playerHead = inventory.getItem(49)
					setLore(playerHead, 0, "&6잔고: &c"+vault.balance(player)+"&6원")
					player.sendMessage(color("&f[&bTR&f] &f"+itemName+" &6"+itemAmount+"&7개를 &6"+itemSell+"&7원에 판매 하였습니다"))
				ELSE
					player.sendMessage(color("&f[&bTR&f] &c판매할 아이템이 부족합니다"))
					ASYNC
						index = slot
						inv = inventory
						originItem = inv.getItem(index)
						warningItem = redGlass
						setItemTitle(warningItem, "&c아이템 부족")
						
						inv.setItem(index, warningItem)
						newInstance("java.lang.Thread").sleep(500)
						inv.setItem(index, originItem)
					ENDASYNC
				ENDIF
			ENDIF
		ENDIF
	ELSE
		IF slot == 53
			player.closeInventory()
			#STOP
		ENDIF
		FOR i = 0:45
			item = inventory.getItem(i)
			IF item != null && item.getItemMeta().getLore() == null
				#STOP
			ENDIF
		ENDFOR
		IF slot == 46
			IF inventory.getItem(slot) != null
				prevPage = inventory.getItem(slot).getAmount()
				FOR i = 0:45
					item = yml.get("shopItems."+((prevPage-1)*45+i)+".item")
					IF item == null
						inventory.setItem(i, null)
					ELSE
						itemBuy = yml.get("shopItems."+((prevPage-1)*45+i)+".buy") * item.getAmount()
						itemSell = yml.get("shopItems."+((prevPage-1)*45+i)+".sell") * item.getAmount()
						addLore(item, "&f--------------------")
						IF itemBuy == -1
							addLore(item, "&a구매: &c구매불가")
						ELSE
							addLore(item, "&a구매: &c"+itemBuy+"&6원")
						ENDIF
						IF itemSell == -1
							addLore(item, "&b판매: &c판매불가")
						ELSE
							addLore(item, "&b판매: &c"+itemSell+"&6원")
						ENDIF
						addLore(item, "&f--------------------")
						inventory.setItem(i, item)
						inventory.setItem(i, item)
					ENDIF
				ENDFOR
				IF prevPage == 1
					inventory.setItem(46, null)
				ELSE
					inventory.getItem(46).setAmount(prevPage-1)
				ENDIF
				pageNext = item("PAPER", prevPage+1)
				setItemTitle(pageNext, "&6다음 페이지")
				inventory.setItem(52, pageNext)
			ENDIF
		ELSEIF slot == 47
			FOR i = 0:45
				item = inventory.getItem(i)
				IF item != null
					IF item.getAmount() < 9
						item.setAmount(1)
					ELSE
						item.setAmount(item.getAmount()-8)
					ENDIF
					loreCount = item.getItemMeta().getLore().size()
					itemBuy = yml.get("shopItems."+((shopPage-1)*45+i)+".buy") * item.getAmount()
					itemSell = yml.get("shopItems."+((shopPage-1)*45+i)+".sell") * item.getAmount()
					IF yml.get("shopItems."+((shopPage-1)*45+i)+".buy") == -1
						setLore(item, loreCount-3, "&a구매: &c구매불가")
					ELSE
						setLore(item, loreCount-3, "&a구매: &c"+itemBuy+"&6원")
					ENDIF
					IF yml.get("shopItems."+((shopPage-1)*45+i)+".sell") == -1
						setLore(item, loreCount-2, "&b판매: &c판매불가")
					ELSE
						setLore(item, loreCount-2, "&b판매: &c"+itemSell+"&6원")
					ENDIF
				ENDIF
			ENDFOR
		ELSEIF slot == 48
			FOR i = 0:45
				item = inventory.getItem(i)
				IF item != null
					IF item.getAmount() == 1
						#STOP
					ENDIF
					item.setAmount(item.getAmount()-1)
					loreCount = item.getItemMeta().getLore().size()
					itemBuy = yml.get("shopItems."+((shopPage-1)*45+i)+".buy") * item.getAmount()
					itemSell = yml.get("shopItems."+((shopPage-1)*45+i)+".sell") * item.getAmount()
					IF yml.get("shopItems."+((shopPage-1)*45+i)+".buy") == -1
						setLore(item, loreCount-3, "&a구매: &c구매불가")
					ELSE
						setLore(item, loreCount-3, "&a구매: &c"+itemBuy+"&6원")
					ENDIF
					IF yml.get("shopItems."+((shopPage-1)*45+i)+".sell") == -1
						setLore(item, loreCount-2, "&b판매: &c판매불가")
					ELSE
						setLore(item, loreCount-2, "&b판매: &c"+itemSell+"&6원")
					ENDIF
				ENDIF
			ENDFOR
		ELSEIF slot == 50
			FOR i = 0:45
				item = inventory.getItem(i)
				IF item != null
					IF item.getAmount() == 64
						#STOP
					ENDIF
					item.setAmount(item.getAmount()+1)
					loreCount = item.getItemMeta().getLore().size()
					itemBuy = yml.get("shopItems."+((shopPage-1)*45+i)+".buy") * item.getAmount()
					itemSell = yml.get("shopItems."+((shopPage-1)*45+i)+".sell") * item.getAmount()
					IF yml.get("shopItems."+((shopPage-1)*45+i)+".buy") == -1
						setLore(item, loreCount-3, "&a구매: &c구매불가")
					ELSE
						setLore(item, loreCount-3, "&a구매: &c"+itemBuy+"&6원")
					ENDIF
					IF yml.get("shopItems."+((shopPage-1)*45+i)+".sell") == -1
						setLore(item, loreCount-2, "&b판매: &c판매불가")
					ELSE
						setLore(item, loreCount-2, "&b판매: &c"+itemSell+"&6원")
					ENDIF
				ENDIF
			ENDFOR
		ELSEIF slot == 51
			FOR i = 0:45
				item = inventory.getItem(i)
				IF item != null
					IF item.getAmount() > 56
						item.setAmount(64)
					ELSE
						IF item.getAmount() % 8 == 0
							item.setAmount(item.getAmount()+8)
						ELSE
							item.setAmount(item.getAmount()+7)
						ENDIF
					ENDIF
					loreCount = item.getItemMeta().getLore().size()
					itemBuy = yml.get("shopItems."+((shopPage-1)*45+i)+".buy") * item.getAmount()
					itemSell = yml.get("shopItems."+((shopPage-1)*45+i)+".sell") * item.getAmount()
					IF yml.get("shopItems."+((shopPage-1)*45+i)+".buy") == -1
						setLore(item, loreCount-3, "&a구매: &c구매불가")
					ELSE
						setLore(item, loreCount-3, "&a구매: &c"+itemBuy+"&6원")
					ENDIF
					IF yml.get("shopItems."+((shopPage-1)*45+i)+".sell") == -1
						setLore(item, loreCount-2, "&b판매: &c판매불가")
					ELSE
						setLore(item, loreCount-2, "&b판매: &c"+itemSell+"&6원")
					ENDIF
				ENDIF
			ENDFOR
		ELSEIF slot == 52
			IF inventory.getItem(slot) != null
				nextPage = inventory.getItem(slot).getAmount()
				FOR i = 0:45
					item = yml.get("shopItems."+((nextPage-1)*45+i)+".item")
					IF item == null
						inventory.setItem(i, null)
					ELSE
						itemBuy = yml.get("shopItems."+((nextPage-1)*45+i)+".buy") * item.getAmount()
						itemSell = yml.get("shopItems."+((nextPage-1)*45+i)+".sell") * item.getAmount()
						addLore(item, "&f--------------------")
						IF itemBuy == -1
							addLore(item, "&a구매: &c구매불가")
						ELSE
							addLore(item, "&a구매: &c"+itemBuy+"&6원")
						ENDIF
						IF itemSell == -1
							addLore(item, "&b판매: &c판매불가")
						ELSE
							addLore(item, "&b판매: &c"+itemSell+"&6원")
						ENDIF
						addLore(item, "&f--------------------")
						inventory.setItem(i, item)
						inventory.setItem(i, item)
					ENDIF
				ENDFOR
				IF yml.get("shopPage") > nextPage
					inventory.getItem(52).setAmount(nextPage+1)
				ELSE
					inventory.setItem(52, null)
				ENDIF
				pagePre = item("PAPER", nextPage-1)
				setItemTitle(pagePre, "&6이전 페이지")
				inventory.setItem(46, pagePre)
			ENDIF
		ENDIF
	ENDIF
ENDIF
