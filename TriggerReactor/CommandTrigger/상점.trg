import io.github.wysohn.triggerreactor.core.main.TriggerReactorCore
import org.bukkit.configuration.file.YamlConfiguration
import org.bukkit.Bukkit
import java.io.File
import java.util.Base64

#call "OJRServer_BasicVariables_JustforReload"

plugin = TriggerReactorCore.getInstance()
commandTrigger = plugin.getCmdManager()
customTrigger = plugin.getCustomManager()
script = "SU1QT1JUIG9yZy5idWtraXQuQnVra2l0DQpJTVBPUlQgamF2YS5pby5GaWxlDQpJTVBPUlQgb3JnLmJ1a2tpdC5jb25maWd1cmF0aW9uLmZpbGUuWWFtbENvbmZpZ3VyYXRpb24NCg0KaW52ZW50b3J5ID0gZXZlbnQuZ2V0SW52ZW50b3J5KCkNCg0KLy8g7ISc67KEIOuyhOyghCDssrTtgawNCnNlcnZlclZlcnNpb25OYW1lID0gQnVra2l0LmdldEJ1a2tpdFZlcnNpb24oKQ0Kc2VydmVyVmVyc2lvblN0cmluZyA9IHNlcnZlclZlcnNpb25OYW1lLnNwbGl0KCItIikNCnNlcnZlcnZlcnNpb24gPSBwYXJzZUludChzZXJ2ZXJWZXJzaW9uU3RyaW5nWzBdLnJlcGxhY2UoIi4iLCAiIikpDQpJRiBzZXJ2ZXJ2ZXJzaW9uID4gMTEyMg0KCWludmVudG9yeU5hbWUgPSBldmVudC5nZXRWaWV3KCkuZ2V0VGl0bGUoKQ0KCXJlZEdsYXNzID0gaXRlbSgiUkVEX1NUQUlORURfR0xBU1NfUEFORSIsIDEpDQpFTFNFDQoJaW52ZW50b3J5TmFtZSA9IGludmVudG9yeS5nZXROYW1lKCkNCglyZWRHbGFzcyA9IGl0ZW0oIlNUQUlORURfR0xBU1NfUEFORSIsIDEsIDE0KQ0KRU5ESUYNCg0KSUYgaW52ZW50b3J5TmFtZS5jb250YWlucygiwqdywqdywqdywqdywqdyIikNCglldmVudC5zZXRDYW5jZWxsZWQodHJ1ZSkNCgkNCglJRiBldmVudC5nZXRDbGlja2VkSW52ZW50b3J5KCkgPT0gbnVsbA0KCQkjU1RPUA0KCUVORElGDQoJSUYgZXZlbnQuZ2V0Q2xpY2tlZEludmVudG9yeSgpLmdldFR5cGUoKS50b1N0cmluZygpLmVxdWFscygiUExBWUVSIikNCgkJI1NUT1ANCglFTkRJRg0KCQ0KCWNvbmZpZ0ZpbGUgPSBGaWxlKCIuL3BsdWdpbnMvVHJpZ2dlclJlYWN0b3IvY29uZmlnLXNob3AueW1sIikNCgljb25maWdZbWwgPSBZYW1sQ29uZmlndXJhdGlvbi5sb2FkQ29uZmlndXJhdGlvbihjb25maWdGaWxlKQ0KCXNob3BJZCA9IGludmVudG9yeU5hbWUuc3Vic3RyaW5nKDAsIGludmVudG9yeU5hbWUuaW5kZXhPZigiwqdywqdywqdywqdywqdyIikpLnJlcGxhY2VBbGwoIsKnIiwgIiIpDQoJc2hvcE5hbWUgPSBjb25maWdZbWwuZ2V0KCJzaG9wTGlzdC4iK3Nob3BJZCsiLnNob3BOYW1lIikNCglwbGF5ZXIgPSBldmVudC5nZXRXaG9DbGlja2VkKCkNCglzbG90ID0gZXZlbnQuZ2V0U2xvdCgpDQoJZmlsZSA9IEZpbGUoIi4vcGx1Z2lucy9UcmlnZ2VyUmVhY3Rvci9TaG9wVHJpZ2dlci8iK3Nob3BOYW1lKyIueW1sIikNCgl5bWwgPSBZYW1sQ29uZmlndXJhdGlvbi5sb2FkQ29uZmlndXJhdGlvbihmaWxlKQ0KCXNob3BQYWdlID0gMQ0KCUlGIGludmVudG9yeS5nZXRJdGVtKDUyKSAhPSBudWxsDQoJCXNob3BQYWdlID0gaW52ZW50b3J5LmdldEl0ZW0oNTIpLmdldEFtb3VudCgpLTENCglFTFNFSUYgaW52ZW50b3J5LmdldEl0ZW0oNDYpICE9IG51bGwNCgkJc2hvcFBhZ2UgPSBpbnZlbnRvcnkuZ2V0SXRlbSg0NikuZ2V0QW1vdW50KCkrMQ0KCUVORElGDQoJDQoJSUYgc2xvdCA8IDQ1DQoJCUZPUiBpID0gMDo0NQ0KCQkJaXRlbSA9IGludmVudG9yeS5nZXRJdGVtKGkpDQoJCQlJRiBpdGVtICE9IG51bGwgJiYgaXRlbS5nZXRJdGVtTWV0YSgpLmdldExvcmUoKSA9PSBudWxsDQoJCQkJI1NUT1ANCgkJCUVORElGDQoJCUVOREZPUg0KCQlJRiB5bWwuZ2V0KCJzaG9wSXRlbXMuIisoKHNob3BQYWdlLTEpKjQ1K3Nsb3QpKSAhPSBudWxsDQoJCQlpdGVtQW1vdW50ID0gZXZlbnQuZ2V0Q3VycmVudEl0ZW0oKS5nZXRBbW91bnQoKQ0KCQkJaXRlbSA9IHltbC5nZXQoInNob3BJdGVtcy4iKygoc2hvcFBhZ2UtMSkqNDUrc2xvdCkrIi5pdGVtIikNCgkJCWNsaWNrID0gZXZlbnQuZ2V0Q2xpY2soKS50b1N0cmluZygpDQoJCQlJRiBjbGljayA9PSAiTEVGVCINCgkJCQlpdGVtQnV5ID0geW1sLmdldCgic2hvcEl0ZW1zLiIrKChzaG9wUGFnZS0xKSo0NStzbG90KSsiLmJ1eSIpICogaXRlbUFtb3VudA0KCQkJCUlGIGl0ZW1CdXkgPiAkbW9uZXkNCgkJCQkJcGxheWVyLnNlbmRNZXNzYWdlKGNvbG9yKCImZlsmYlRSJmZdICZj7IaM7KeA6riI7J20IOu2gOyhse2VqeuLiOuLpCIpKQ0KCQkJCQlBU1lOQw0KCQkJCQkJaW5kZXggPSBzbG90DQoJCQkJCQlpbnYgPSBpbnZlbnRvcnkNCgkJCQkJCW9yaWdpbkl0ZW0gPSBpbnYuZ2V0SXRlbShpbmRleCkNCgkJCQkJCXdhcm5pbmdJdGVtID0gcmVkR2xhc3MNCgkJCQkJCXNldEl0ZW1UaXRsZSh3YXJuaW5nSXRlbSwgIiZj7IaM7KeA6riIIOu2gOyhsSIpDQoJCQkJCQkNCgkJCQkJCWludi5zZXRJdGVtKGluZGV4LCB3YXJuaW5nSXRlbSkNCgkJCQkJCW5ld0luc3RhbmNlKCJqYXZhLmxhbmcuVGhyZWFkIikuc2xlZXAoNTAwKQ0KCQkJCQkJaW52LnNldEl0ZW0oaW5kZXgsIG9yaWdpbkl0ZW0pDQoJCQkJCUVOREFTWU5DDQoJCQkJRUxTRUlGICRlbXB0eXNsb3QgPT0gLTENCgkJCQkJcGxheWVyLnNlbmRNZXNzYWdlKGNvbG9yKCImZlsmYlRSJmZdICZj7J2467Kk7Yag66as6rCAIOqwgOuTnSDssKjsnojsirXri4jri6QiKSkNCgkJCQkJQVNZTkMNCgkJCQkJCWluZGV4ID0gc2xvdA0KCQkJCQkJaW52ID0gaW52ZW50b3J5DQoJCQkJCQlvcmlnaW5JdGVtID0gaW52LmdldEl0ZW0oaW5kZXgpDQoJCQkJCQl3YXJuaW5nSXRlbSA9IHJlZEdsYXNzDQoJCQkJCQlzZXRJdGVtVGl0bGUod2FybmluZ0l0ZW0sICImY+yduOuypO2GoOumrCDrtoDsobEiKQ0KCQkJCQkJDQoJCQkJCQlpbnYuc2V0SXRlbShpbmRleCwgd2FybmluZ0l0ZW0pDQoJCQkJCQluZXdJbnN0YW5jZSgiamF2YS5sYW5nLlRocmVhZCIpLnNsZWVwKDUwMCkNCgkJCQkJCWludi5zZXRJdGVtKGluZGV4LCBvcmlnaW5JdGVtKQ0KCQkJCQlFTkRBU1lOQw0KCQkJCUVMU0VJRiB5bWwuZ2V0KCJzaG9wSXRlbXMuIisoKHNob3BQYWdlLTEpKjQ1K3Nsb3QpKyIuYnV5IikgPT0gLTENCgkJCQkJcGxheWVyLnNlbmRNZXNzYWdlKGNvbG9yKCImZlsmYlRSJmZdICZj6rWs66ek6rCAIOu2iOqwgOuKpe2VnCDsg4HtkojsnoXri4jri6QiKSkNCgkJCQkJQVNZTkMNCgkJCQkJCWluZGV4ID0gc2xvdA0KCQkJCQkJaW52ID0gaW52ZW50b3J5DQoJCQkJCQlvcmlnaW5JdGVtID0gaW52LmdldEl0ZW0oaW5kZXgpDQoJCQkJCQl3YXJuaW5nSXRlbSA9IHJlZEdsYXNzDQoJCQkJCQlzZXRJdGVtVGl0bGUod2FybmluZ0l0ZW0sICImY+q1rOunpOu2iOqwgCIpDQoJCQkJCQkNCgkJCQkJCWludi5zZXRJdGVtKGluZGV4LCB3YXJuaW5nSXRlbSkNCgkJCQkJCW5ld0luc3RhbmNlKCJqYXZhLmxhbmcuVGhyZWFkIikuc2xlZXAoNTAwKQ0KCQkJCQkJaW52LnNldEl0ZW0oaW5kZXgsIG9yaWdpbkl0ZW0pDQoJCQkJCUVOREFTWU5DDQoJCQkJRUxTRQ0KCQkJCQl2YXVsdC50YWtlKHBsYXllciwgaXRlbUJ1eSkNCgkJCQkJaXRlbU1ldGEgPSBpdGVtLmdldEl0ZW1NZXRhKCkNCgkJCQkJbG9yZSA9IGl0ZW1NZXRhLmdldExvcmUoKQ0KCQkJCQluZXdMb3JlID0gbGlzdCgpDQoJCQkJCUlGIGxvcmUgPT0gbnVsbA0KCQkJCQkJbG9yZUNvdW50ID0gMA0KCQkJCQlFTFNFDQoJCQkJCQlsb3JlQ291bnQgPSBsb3JlLnNpemUoKQ0KCQkJCQlFTkRJRg0KCQkJCQlGT1IgaSA9IDA6KGxvcmVDb3VudC00KQ0KCQkJCQkJbmV3TG9yZS5hZGQobG9yZS5nZXQoaSkpDQoJCQkJCUVOREZPUg0KCQkJCQlpdGVtTWV0YS5zZXRMb3JlKG5ld0xvcmUpDQoJCQkJCWl0ZW0uc2V0SXRlbU1ldGEoaXRlbU1ldGEpDQoJCQkJCWl0ZW0uc2V0QW1vdW50KGl0ZW1BbW91bnQpDQoJCQkJCXBsYXllci5nZXRJbnZlbnRvcnkoKS5hZGRJdGVtKGl0ZW0pDQoJCQkJCWl0ZW1OYW1lID0gaXRlbS5nZXRUeXBlKCkudG9TdHJpbmcoKQ0KCQkJCQlJRiBpdGVtLmdldEl0ZW1NZXRhKCkuZ2V0RGlzcGxheU5hbWUoKSAhPSBudWxsDQoJCQkJCQlpdGVtTmFtZSA9IGl0ZW0uZ2V0SXRlbU1ldGEoKS5nZXREaXNwbGF5TmFtZSgpDQoJCQkJCUVORElGDQoJCQkJCXBsYXllckhlYWQgPSBpbnZlbnRvcnkuZ2V0SXRlbSg0OSkNCgkJCQkJc2V0TG9yZShwbGF5ZXJIZWFkLCAwLCAiJjbsnpTqs6A6ICZjIit2YXVsdC5iYWxhbmNlKHBsYXllcikrIiY27JuQIikNCgkJCQkJcGxheWVyLnNlbmRNZXNzYWdlKGNvbG9yKCImZlsmYlRSJmZdICZmIitpdGVtTmFtZSsiICY2IitpdGVtLmdldEFtb3VudCgpKyImN+qwnOulvCAmNiIraXRlbUJ1eSsiJjfsm5Dsl5Ag6rWs66ekIO2VmOyYgOyKteuLiOuLpCIpKQ0KCQkJCUVORElGDQoJCQlFTFNFSUYgY2xpY2sgPT0gIlJJR0hUIg0KCQkJCWl0ZW1TZWxsID0geW1sLmdldCgic2hvcEl0ZW1zLiIrKChzaG9wUGFnZS0xKSo0NStzbG90KSsiLnNlbGwiKSAqIGl0ZW1BbW91bnQNCgkJCQlpdGVtLnNldEFtb3VudChpdGVtQW1vdW50KQ0KCQkJCWl0ZW1OYW1lID0gaXRlbS5nZXRUeXBlKCkudG9TdHJpbmcoKQ0KCQkJCUlGIGl0ZW0uZ2V0SXRlbU1ldGEoKS5nZXREaXNwbGF5TmFtZSgpICE9IG51bGwNCgkJCQkJaXRlbU5hbWUgPSBpdGVtLmdldEl0ZW1NZXRhKCkuZ2V0RGlzcGxheU5hbWUoKQ0KCQkJCUVORElGDQoJCQkJSUYgeW1sLmdldCgic2hvcEl0ZW1zLiIrKChzaG9wUGFnZS0xKSo0NStzbG90KSsiLnNlbGwiKSA9PSAtMQ0KCQkJCQlwbGF5ZXIuc2VuZE1lc3NhZ2UoY29sb3IoIiZmWyZiVFImZl0gJmPtjJDrp6TqsIAg67aI6rCA64ql7ZWcIOyDge2SiOyeheuLiOuLpCIpKQ0KCQkJCQlBU1lOQw0KCQkJCQkJaW5kZXggPSBzbG90DQoJCQkJCQlpbnYgPSBpbnZlbnRvcnkNCgkJCQkJCW9yaWdpbkl0ZW0gPSBpbnYuZ2V0SXRlbShpbmRleCkNCgkJCQkJCXdhcm5pbmdJdGVtID0gcmVkR2xhc3MNCgkJCQkJCXNldEl0ZW1UaXRsZSh3YXJuaW5nSXRlbSwgIiZj7YyQ66ek67aI6rCAIikNCgkJCQkJCQ0KCQkJCQkJaW52LnNldEl0ZW0oaW5kZXgsIHdhcm5pbmdJdGVtKQ0KCQkJCQkJbmV3SW5zdGFuY2UoImphdmEubGFuZy5UaHJlYWQiKS5zbGVlcCg1MDApDQoJCQkJCQlpbnYuc2V0SXRlbShpbmRleCwgb3JpZ2luSXRlbSkNCgkJCQkJRU5EQVNZTkMNCgkJCQlFTFNFSUYgcGxheWVyLmdldEludmVudG9yeSgpLmNvbnRhaW5zQXRMZWFzdChpdGVtLCBpdGVtQW1vdW50KQ0KCQkJCQlwbGF5ZXIuZ2V0SW52ZW50b3J5KCkucmVtb3ZlSXRlbShpdGVtKQ0KCQkJCQl2YXVsdC5naXZlKHBsYXllciwgaXRlbVNlbGwpDQoJCQkJCXBsYXllckhlYWQgPSBpbnZlbnRvcnkuZ2V0SXRlbSg0OSkNCgkJCQkJc2V0TG9yZShwbGF5ZXJIZWFkLCAwLCAiJjbsnpTqs6A6ICZjIit2YXVsdC5iYWxhbmNlKHBsYXllcikrIiY27JuQIikNCgkJCQkJcGxheWVyLnNlbmRNZXNzYWdlKGNvbG9yKCImZlsmYlRSJmZdICZmIitpdGVtTmFtZSsiICY2IitpdGVtQW1vdW50KyImN+qwnOulvCAmNiIraXRlbVNlbGwrIiY37JuQ7JeQIO2MkOunpCDtlZjsmIDsirXri4jri6QiKSkNCgkJCQlFTFNFDQoJCQkJCXBsYXllci5zZW5kTWVzc2FnZShjb2xvcigiJmZbJmJUUiZmXSAmY+2MkOunpO2VoCDslYTsnbTthZzsnbQg67aA7KGx7ZWp64uI64ukIikpDQoJCQkJCUFTWU5DDQoJCQkJCQlpbmRleCA9IHNsb3QNCgkJCQkJCWludiA9IGludmVudG9yeQ0KCQkJCQkJb3JpZ2luSXRlbSA9IGludi5nZXRJdGVtKGluZGV4KQ0KCQkJCQkJd2FybmluZ0l0ZW0gPSByZWRHbGFzcw0KCQkJCQkJc2V0SXRlbVRpdGxlKHdhcm5pbmdJdGVtLCAiJmPslYTsnbTthZwg67aA7KGxIikNCgkJCQkJCQ0KCQkJCQkJaW52LnNldEl0ZW0oaW5kZXgsIHdhcm5pbmdJdGVtKQ0KCQkJCQkJbmV3SW5zdGFuY2UoImphdmEubGFuZy5UaHJlYWQiKS5zbGVlcCg1MDApDQoJCQkJCQlpbnYuc2V0SXRlbShpbmRleCwgb3JpZ2luSXRlbSkNCgkJCQkJRU5EQVNZTkMNCgkJCQlFTkRJRg0KCQkJRU5ESUYNCgkJRU5ESUYNCglFTFNFDQoJCUlGIHNsb3QgPT0gNTMNCgkJCXBsYXllci5jbG9zZUludmVudG9yeSgpDQoJCQkjU1RPUA0KCQlFTkRJRg0KCQlGT1IgaSA9IDA6NDUNCgkJCWl0ZW0gPSBpbnZlbnRvcnkuZ2V0SXRlbShpKQ0KCQkJSUYgaXRlbSAhPSBudWxsICYmIGl0ZW0uZ2V0SXRlbU1ldGEoKS5nZXRMb3JlKCkgPT0gbnVsbA0KCQkJCSNTVE9QDQoJCQlFTkRJRg0KCQlFTkRGT1INCgkJSUYgc2xvdCA9PSA0Ng0KCQkJSUYgaW52ZW50b3J5LmdldEl0ZW0oc2xvdCkgIT0gbnVsbA0KCQkJCXByZXZQYWdlID0gaW52ZW50b3J5LmdldEl0ZW0oc2xvdCkuZ2V0QW1vdW50KCkNCgkJCQlGT1IgaSA9IDA6NDUNCgkJCQkJaXRlbSA9IHltbC5nZXQoInNob3BJdGVtcy4iKygocHJldlBhZ2UtMSkqNDUraSkrIi5pdGVtIikNCgkJCQkJSUYgaXRlbSA9PSBudWxsDQoJCQkJCQlpbnZlbnRvcnkuc2V0SXRlbShpLCBudWxsKQ0KCQkJCQlFTFNFDQoJCQkJCQlpdGVtQnV5ID0geW1sLmdldCgic2hvcEl0ZW1zLiIrKChwcmV2UGFnZS0xKSo0NStpKSsiLmJ1eSIpICogaXRlbS5nZXRBbW91bnQoKQ0KCQkJCQkJaXRlbVNlbGwgPSB5bWwuZ2V0KCJzaG9wSXRlbXMuIisoKHByZXZQYWdlLTEpKjQ1K2kpKyIuc2VsbCIpICogaXRlbS5nZXRBbW91bnQoKQ0KCQkJCQkJYWRkTG9yZShpdGVtLCAiJmYtLS0tLS0tLS0tLS0tLS0tLS0tLSIpDQoJCQkJCQlJRiBpdGVtQnV5ID09IC0xDQoJCQkJCQkJYWRkTG9yZShpdGVtLCAiJmHqtazrp6Q6ICZj6rWs66ek67aI6rCAIikNCgkJCQkJCUVMU0UNCgkJCQkJCQlhZGRMb3JlKGl0ZW0sICImYeq1rOunpDogJmMiK2l0ZW1CdXkrIiY27JuQIikNCgkJCQkJCUVORElGDQoJCQkJCQlJRiBpdGVtU2VsbCA9PSAtMQ0KCQkJCQkJCWFkZExvcmUoaXRlbSwgIiZi7YyQ66ekOiAmY+2MkOunpOu2iOqwgCIpDQoJCQkJCQlFTFNFDQoJCQkJCQkJYWRkTG9yZShpdGVtLCAiJmLtjJDrp6Q6ICZjIitpdGVtU2VsbCsiJjbsm5AiKQ0KCQkJCQkJRU5ESUYNCgkJCQkJCWFkZExvcmUoaXRlbSwgIiZmLS0tLS0tLS0tLS0tLS0tLS0tLS0iKQ0KCQkJCQkJaW52ZW50b3J5LnNldEl0ZW0oaSwgaXRlbSkNCgkJCQkJCWludmVudG9yeS5zZXRJdGVtKGksIGl0ZW0pDQoJCQkJCUVORElGDQoJCQkJRU5ERk9SDQoJCQkJSUYgcHJldlBhZ2UgPT0gMQ0KCQkJCQlpbnZlbnRvcnkuc2V0SXRlbSg0NiwgbnVsbCkNCgkJCQlFTFNFDQoJCQkJCWludmVudG9yeS5nZXRJdGVtKDQ2KS5zZXRBbW91bnQocHJldlBhZ2UtMSkNCgkJCQlFTkRJRg0KCQkJCXBhZ2VOZXh0ID0gaXRlbSgiUEFQRVIiLCBwcmV2UGFnZSsxKQ0KCQkJCXNldEl0ZW1UaXRsZShwYWdlTmV4dCwgIiY264uk7J2MIO2OmOydtOyngCIpDQoJCQkJaW52ZW50b3J5LnNldEl0ZW0oNTIsIHBhZ2VOZXh0KQ0KCQkJRU5ESUYNCgkJRUxTRUlGIHNsb3QgPT0gNDcNCgkJCUZPUiBpID0gMDo0NQ0KCQkJCWl0ZW0gPSBpbnZlbnRvcnkuZ2V0SXRlbShpKQ0KCQkJCUlGIGl0ZW0gIT0gbnVsbA0KCQkJCQlJRiBpdGVtLmdldEFtb3VudCgpIDwgOQ0KCQkJCQkJaXRlbS5zZXRBbW91bnQoMSkNCgkJCQkJRUxTRQ0KCQkJCQkJaXRlbS5zZXRBbW91bnQoaXRlbS5nZXRBbW91bnQoKS04KQ0KCQkJCQlFTkRJRg0KCQkJCQlsb3JlQ291bnQgPSBpdGVtLmdldEl0ZW1NZXRhKCkuZ2V0TG9yZSgpLnNpemUoKQ0KCQkJCQlpdGVtQnV5ID0geW1sLmdldCgic2hvcEl0ZW1zLiIrKChzaG9wUGFnZS0xKSo0NStpKSsiLmJ1eSIpICogaXRlbS5nZXRBbW91bnQoKQ0KCQkJCQlpdGVtU2VsbCA9IHltbC5nZXQoInNob3BJdGVtcy4iKygoc2hvcFBhZ2UtMSkqNDUraSkrIi5zZWxsIikgKiBpdGVtLmdldEFtb3VudCgpDQoJCQkJCUlGIHltbC5nZXQoInNob3BJdGVtcy4iKygoc2hvcFBhZ2UtMSkqNDUraSkrIi5idXkiKSA9PSAtMQ0KCQkJCQkJc2V0TG9yZShpdGVtLCBsb3JlQ291bnQtMywgIiZh6rWs66ekOiAmY+q1rOunpOu2iOqwgCIpDQoJCQkJCUVMU0UNCgkJCQkJCXNldExvcmUoaXRlbSwgbG9yZUNvdW50LTMsICImYeq1rOunpDogJmMiK2l0ZW1CdXkrIiY27JuQIikNCgkJCQkJRU5ESUYNCgkJCQkJSUYgeW1sLmdldCgic2hvcEl0ZW1zLiIrKChzaG9wUGFnZS0xKSo0NStpKSsiLnNlbGwiKSA9PSAtMQ0KCQkJCQkJc2V0TG9yZShpdGVtLCBsb3JlQ291bnQtMiwgIiZi7YyQ66ekOiAmY+2MkOunpOu2iOqwgCIpDQoJCQkJCUVMU0UNCgkJCQkJCXNldExvcmUoaXRlbSwgbG9yZUNvdW50LTIsICImYu2MkOunpDogJmMiK2l0ZW1TZWxsKyImNuybkCIpDQoJCQkJCUVORElGDQoJCQkJRU5ESUYNCgkJCUVOREZPUg0KCQlFTFNFSUYgc2xvdCA9PSA0OA0KCQkJRk9SIGkgPSAwOjQ1DQoJCQkJaXRlbSA9IGludmVudG9yeS5nZXRJdGVtKGkpDQoJCQkJSUYgaXRlbSAhPSBudWxsDQoJCQkJCUlGIGl0ZW0uZ2V0QW1vdW50KCkgPT0gMQ0KCQkJCQkJI1NUT1ANCgkJCQkJRU5ESUYNCgkJCQkJaXRlbS5zZXRBbW91bnQoaXRlbS5nZXRBbW91bnQoKS0xKQ0KCQkJCQlsb3JlQ291bnQgPSBpdGVtLmdldEl0ZW1NZXRhKCkuZ2V0TG9yZSgpLnNpemUoKQ0KCQkJCQlpdGVtQnV5ID0geW1sLmdldCgic2hvcEl0ZW1zLiIrKChzaG9wUGFnZS0xKSo0NStpKSsiLmJ1eSIpICogaXRlbS5nZXRBbW91bnQoKQ0KCQkJCQlpdGVtU2VsbCA9IHltbC5nZXQoInNob3BJdGVtcy4iKygoc2hvcFBhZ2UtMSkqNDUraSkrIi5zZWxsIikgKiBpdGVtLmdldEFtb3VudCgpDQoJCQkJCUlGIHltbC5nZXQoInNob3BJdGVtcy4iKygoc2hvcFBhZ2UtMSkqNDUraSkrIi5idXkiKSA9PSAtMQ0KCQkJCQkJc2V0TG9yZShpdGVtLCBsb3JlQ291bnQtMywgIiZh6rWs66ekOiAmY+q1rOunpOu2iOqwgCIpDQoJCQkJCUVMU0UNCgkJCQkJCXNldExvcmUoaXRlbSwgbG9yZUNvdW50LTMsICImYeq1rOunpDogJmMiK2l0ZW1CdXkrIiY27JuQIikNCgkJCQkJRU5ESUYNCgkJCQkJSUYgeW1sLmdldCgic2hvcEl0ZW1zLiIrKChzaG9wUGFnZS0xKSo0NStpKSsiLnNlbGwiKSA9PSAtMQ0KCQkJCQkJc2V0TG9yZShpdGVtLCBsb3JlQ291bnQtMiwgIiZi7YyQ66ekOiAmY+2MkOunpOu2iOqwgCIpDQoJCQkJCUVMU0UNCgkJCQkJCXNldExvcmUoaXRlbSwgbG9yZUNvdW50LTIsICImYu2MkOunpDogJmMiK2l0ZW1TZWxsKyImNuybkCIpDQoJCQkJCUVORElGDQoJCQkJRU5ESUYNCgkJCUVOREZPUg0KCQlFTFNFSUYgc2xvdCA9PSA1MA0KCQkJRk9SIGkgPSAwOjQ1DQoJCQkJaXRlbSA9IGludmVudG9yeS5nZXRJdGVtKGkpDQoJCQkJSUYgaXRlbSAhPSBudWxsDQoJCQkJCUlGIGl0ZW0uZ2V0QW1vdW50KCkgPT0gNjQNCgkJCQkJCSNTVE9QDQoJCQkJCUVORElGDQoJCQkJCWl0ZW0uc2V0QW1vdW50KGl0ZW0uZ2V0QW1vdW50KCkrMSkNCgkJCQkJbG9yZUNvdW50ID0gaXRlbS5nZXRJdGVtTWV0YSgpLmdldExvcmUoKS5zaXplKCkNCgkJCQkJaXRlbUJ1eSA9IHltbC5nZXQoInNob3BJdGVtcy4iKygoc2hvcFBhZ2UtMSkqNDUraSkrIi5idXkiKSAqIGl0ZW0uZ2V0QW1vdW50KCkNCgkJCQkJaXRlbVNlbGwgPSB5bWwuZ2V0KCJzaG9wSXRlbXMuIisoKHNob3BQYWdlLTEpKjQ1K2kpKyIuc2VsbCIpICogaXRlbS5nZXRBbW91bnQoKQ0KCQkJCQlJRiB5bWwuZ2V0KCJzaG9wSXRlbXMuIisoKHNob3BQYWdlLTEpKjQ1K2kpKyIuYnV5IikgPT0gLTENCgkJCQkJCXNldExvcmUoaXRlbSwgbG9yZUNvdW50LTMsICImYeq1rOunpDogJmPqtazrp6TrtojqsIAiKQ0KCQkJCQlFTFNFDQoJCQkJCQlzZXRMb3JlKGl0ZW0sIGxvcmVDb3VudC0zLCAiJmHqtazrp6Q6ICZjIitpdGVtQnV5KyImNuybkCIpDQoJCQkJCUVORElGDQoJCQkJCUlGIHltbC5nZXQoInNob3BJdGVtcy4iKygoc2hvcFBhZ2UtMSkqNDUraSkrIi5zZWxsIikgPT0gLTENCgkJCQkJCXNldExvcmUoaXRlbSwgbG9yZUNvdW50LTIsICImYu2MkOunpDogJmPtjJDrp6TrtojqsIAiKQ0KCQkJCQlFTFNFDQoJCQkJCQlzZXRMb3JlKGl0ZW0sIGxvcmVDb3VudC0yLCAiJmLtjJDrp6Q6ICZjIitpdGVtU2VsbCsiJjbsm5AiKQ0KCQkJCQlFTkRJRg0KCQkJCUVORElGDQoJCQlFTkRGT1INCgkJRUxTRUlGIHNsb3QgPT0gNTENCgkJCUZPUiBpID0gMDo0NQ0KCQkJCWl0ZW0gPSBpbnZlbnRvcnkuZ2V0SXRlbShpKQ0KCQkJCUlGIGl0ZW0gIT0gbnVsbA0KCQkJCQlJRiBpdGVtLmdldEFtb3VudCgpID4gNTYNCgkJCQkJCWl0ZW0uc2V0QW1vdW50KDY0KQ0KCQkJCQlFTFNFDQoJCQkJCQlJRiBpdGVtLmdldEFtb3VudCgpICUgOCA9PSAwDQoJCQkJCQkJaXRlbS5zZXRBbW91bnQoaXRlbS5nZXRBbW91bnQoKSs4KQ0KCQkJCQkJRUxTRQ0KCQkJCQkJCWl0ZW0uc2V0QW1vdW50KGl0ZW0uZ2V0QW1vdW50KCkrNykNCgkJCQkJCUVORElGDQoJCQkJCUVORElGDQoJCQkJCWxvcmVDb3VudCA9IGl0ZW0uZ2V0SXRlbU1ldGEoKS5nZXRMb3JlKCkuc2l6ZSgpDQoJCQkJCWl0ZW1CdXkgPSB5bWwuZ2V0KCJzaG9wSXRlbXMuIisoKHNob3BQYWdlLTEpKjQ1K2kpKyIuYnV5IikgKiBpdGVtLmdldEFtb3VudCgpDQoJCQkJCWl0ZW1TZWxsID0geW1sLmdldCgic2hvcEl0ZW1zLiIrKChzaG9wUGFnZS0xKSo0NStpKSsiLnNlbGwiKSAqIGl0ZW0uZ2V0QW1vdW50KCkNCgkJCQkJSUYgeW1sLmdldCgic2hvcEl0ZW1zLiIrKChzaG9wUGFnZS0xKSo0NStpKSsiLmJ1eSIpID09IC0xDQoJCQkJCQlzZXRMb3JlKGl0ZW0sIGxvcmVDb3VudC0zLCAiJmHqtazrp6Q6ICZj6rWs66ek67aI6rCAIikNCgkJCQkJRUxTRQ0KCQkJCQkJc2V0TG9yZShpdGVtLCBsb3JlQ291bnQtMywgIiZh6rWs66ekOiAmYyIraXRlbUJ1eSsiJjbsm5AiKQ0KCQkJCQlFTkRJRg0KCQkJCQlJRiB5bWwuZ2V0KCJzaG9wSXRlbXMuIisoKHNob3BQYWdlLTEpKjQ1K2kpKyIuc2VsbCIpID09IC0xDQoJCQkJCQlzZXRMb3JlKGl0ZW0sIGxvcmVDb3VudC0yLCAiJmLtjJDrp6Q6ICZj7YyQ66ek67aI6rCAIikNCgkJCQkJRUxTRQ0KCQkJCQkJc2V0TG9yZShpdGVtLCBsb3JlQ291bnQtMiwgIiZi7YyQ66ekOiAmYyIraXRlbVNlbGwrIiY27JuQIikNCgkJCQkJRU5ESUYNCgkJCQlFTkRJRg0KCQkJRU5ERk9SDQoJCUVMU0VJRiBzbG90ID09IDUyDQoJCQlJRiBpbnZlbnRvcnkuZ2V0SXRlbShzbG90KSAhPSBudWxsDQoJCQkJbmV4dFBhZ2UgPSBpbnZlbnRvcnkuZ2V0SXRlbShzbG90KS5nZXRBbW91bnQoKQ0KCQkJCUZPUiBpID0gMDo0NQ0KCQkJCQlpdGVtID0geW1sLmdldCgic2hvcEl0ZW1zLiIrKChuZXh0UGFnZS0xKSo0NStpKSsiLml0ZW0iKQ0KCQkJCQlJRiBpdGVtID09IG51bGwNCgkJCQkJCWludmVudG9yeS5zZXRJdGVtKGksIG51bGwpDQoJCQkJCUVMU0UNCgkJCQkJCWl0ZW1CdXkgPSB5bWwuZ2V0KCJzaG9wSXRlbXMuIisoKG5leHRQYWdlLTEpKjQ1K2kpKyIuYnV5IikgKiBpdGVtLmdldEFtb3VudCgpDQoJCQkJCQlpdGVtU2VsbCA9IHltbC5nZXQoInNob3BJdGVtcy4iKygobmV4dFBhZ2UtMSkqNDUraSkrIi5zZWxsIikgKiBpdGVtLmdldEFtb3VudCgpDQoJCQkJCQlhZGRMb3JlKGl0ZW0sICImZi0tLS0tLS0tLS0tLS0tLS0tLS0tIikNCgkJCQkJCUlGIGl0ZW1CdXkgPT0gLTENCgkJCQkJCQlhZGRMb3JlKGl0ZW0sICImYeq1rOunpDogJmPqtazrp6TrtojqsIAiKQ0KCQkJCQkJRUxTRQ0KCQkJCQkJCWFkZExvcmUoaXRlbSwgIiZh6rWs66ekOiAmYyIraXRlbUJ1eSsiJjbsm5AiKQ0KCQkJCQkJRU5ESUYNCgkJCQkJCUlGIGl0ZW1TZWxsID09IC0xDQoJCQkJCQkJYWRkTG9yZShpdGVtLCAiJmLtjJDrp6Q6ICZj7YyQ66ek67aI6rCAIikNCgkJCQkJCUVMU0UNCgkJCQkJCQlhZGRMb3JlKGl0ZW0sICImYu2MkOunpDogJmMiK2l0ZW1TZWxsKyImNuybkCIpDQoJCQkJCQlFTkRJRg0KCQkJCQkJYWRkTG9yZShpdGVtLCAiJmYtLS0tLS0tLS0tLS0tLS0tLS0tLSIpDQoJCQkJCQlpbnZlbnRvcnkuc2V0SXRlbShpLCBpdGVtKQ0KCQkJCQkJaW52ZW50b3J5LnNldEl0ZW0oaSwgaXRlbSkNCgkJCQkJRU5ESUYNCgkJCQlFTkRGT1INCgkJCQlJRiB5bWwuZ2V0KCJzaG9wUGFnZSIpID4gbmV4dFBhZ2UNCgkJCQkJaW52ZW50b3J5LmdldEl0ZW0oNTIpLnNldEFtb3VudChuZXh0UGFnZSsxKQ0KCQkJCUVMU0UNCgkJCQkJaW52ZW50b3J5LnNldEl0ZW0oNTIsIG51bGwpDQoJCQkJRU5ESUYNCgkJCQlwYWdlUHJlID0gaXRlbSgiUEFQRVIiLCBuZXh0UGFnZS0xKQ0KCQkJCXNldEl0ZW1UaXRsZShwYWdlUHJlLCAiJjbsnbTsoIQg7Y6Y7J207KeAIikNCgkJCQlpbnZlbnRvcnkuc2V0SXRlbSg0NiwgcGFnZVByZSkNCgkJCUVORElGDQoJCUVORElGDQoJRU5ESUYNCkVORElGDQo"
scriptText = newInstance("java.lang.String", Base64.getDecoder().decode(script), "UTF-8")

IF (args.length == 2)
    IF (args[0] == "열기")
        ojr_shopName = args[1]
        file = File("./plugins/TriggerReactor/ShopTrigger/"+ojr_shopName+".yml")
        yml = YamlConfiguration.loadConfiguration(file)
        IF (!file.exists())
            #MESSAGE {"ojr_prefix"} + "&4해당 상점은 존재하지 않습니다!"
            #STOP
        ENDIF
        shopId = yml.get("shopId") + ""
        shopIdToData = shopId.replaceAll("","§")
        shopDisplayName = yml.get("shopDisplayName")
        inventory = Bukkit.createInventory(null, 54, shopIdToData+"r§r§r§r§r"+shopDisplayName.replaceAll("&","§").replaceAll("\\^"," "))

        FOR i = 0:45
            IF (yml.get("shopItems."+i) != null)
                item = yml.get("shopItems."+i+".item")
                itemBuy = yml.get("shopItems."+i+".buy")
                itemSell = yml.get("shopItems."+i+".sell")
                addLore(item, "&6----------------------------")
                addLore(item, "&6 구매가격 : &d"+itemBuy)
                addLore(item, "&6 판매가격 : &d"+itemSell)
                addLore(item, "&6----------------------------")
                inventory.setItem(i, item)
            ENDIF
        ENDFOR

        description = item("BOOK", 1)
        setItemTitle(description, "&a상점 설명")
        addLore(description, "&6----------------------------")
        addLore(description, "&6 좌클릭 : &a구매")
        addLore(description, "&6 우믈릭 : &a판매")
        addLore(description, "&6 쉬프트+우클릭 : &a모두 판매")
        addLore(description, "&6----------------------------")
        inventory.setItem(48, description)

        player.openInventory(inventory)
    ENDIF
ENDIF

// 권한 확인
IF (!$haspermission:"OJRShop.admin")
    #MESSAGE {"ojr_prefix"} + "&4명령어를 실행할 권한이 없습니다."
    #STOP
ENDIF

// CustomTrigger 생성
IF (OJRShopCustomTrigger == null)
    Bukkit.getConsoleSender().sendMessage(color({"ojr_prefix"} + "&eCustomTrigger 생성중..."))
    customTrigger.createCustomTrigger("org.bukkit.event.inventory.InventoryClickEvent", "OJR-Shop-InventoryClickEvent", scriptText)
	plugin.saveAsynchronously(customTrigger)
	OJRShopCustomTrigger = customTrigger.get("OJR-Shop-InventoryClickEvent")
	OJRShopCustomTrigger.setSync(true);
	plugin.saveAsynchronously(customTrigger)
    Bukkit.getConsoleSender().sendMessage(color({"ojr_prefix"} + "&eCustomTrigger 생성 완료."))
ENDIF

// CustomTrigger 복구
ASYNC
    import org.bukkit.Bukkit
    IF (OJRShopCustomTrigger.getScript() != scriptText)
        Bukkit.getConsoleSender().sendMessage(color({"ojr_prefix"} + "&cCustomTrigger 파일이 손상되어 재생성합니다."))
        customTrigger.get("OJR-Shop-InventoryClickEvent").setScript(scriptText)
        plugin.saveAsynchronously(customTrigger)
        Bukkit.getConsoleSender().sendMessage(color({"ojr_prefix"} + "&2손상된 CustromTrigger 파일이 복구되었습니다."))
    ENDIF
ENDASYNC

// config-shop.yml 파일
configFile = File("./plugins/TriggerReactor/config-shop.yml")
configYml = YamlConfiguration.loadConfiguration(configFile)
IF (!configFile.exists())
    Bukkit.getConsoleSender().sendMessage(color({"ojr_prefix"} + "&econfig 파일 생성중..."))
    configYml.set("shopCount", 0)
    configYml.set("shopList", list())
    configYml.save(configFile)
    Bukkit.getConsoleSender().sendMessage(color({"ojr_prefix"} + "&econfig 파일 생성 완료"))
ENDIF

IF (args.length == 1)
// /상점 목록
    IF (args[0] == "목록")
        shopList = ""
        shops = File("./plugins/TriggerReactor/ShopTrigger/").listFiles()
        shopList = shopList + shops[0].getName().substring(0, shops[0].getName().lastIndexOf("."))
        FOR i = 1:shops.length
            shopList = shopList + ", " + shops[i].getName().substring(0, shops[i].getName().lastIndexOf("."))
        ENDFOR
        #MESSAGE {"ojr_prefix"} + "&b상점 리스트 : &e" + shopList
    ENDIF
ELSEIF (args.length == 2)
// /상점 삭제 <상점아이디>
    IF (args[0] == "삭제")
        ojr_shopname_todel = args[1]
        shop = File("./plugins/TriggerReactor/ShopTrigger/"+ojr_shopname_todel+".yml")
        yml = YamlConfiguration.loadConfiguration(shop)
        IF !shop.exists()
            #MESSAGE {"ojr_prefix"} + "&4해당 상점은 존재하지 않습니다!"
            #STOP
        ENDIF
        shopId = yml.get("shopId")
        configYml.set("shopList."+shopId, null)
        configYml.save(configFile)
        shop.delete()
        #MESSAGE {"ojr_prefix"} + "&e" + ojr_shopname_todel + "&f(이)가 삭제되었습니다."
    ELSEIF (args[0] == "아이템")
        IF (args[0] == "등록")
            #MESSAGE {"ojr_prefix"} + "&d/상점 아이템 등록 <상점아이디> <페이지번호> <아이템칸 번호> <구매가격(단위포함)> <판매가격(단위포함)>"
            #MESSAGE {"ojr_prefix"} + "&6<구매가격/판매가격>은 단위를 포함해 입력해주세요. 띄어쓰기는 허용되지 않으며 0도 입력해주세요."
            #MESSAGE {"ojr_prefix"} + "&6예시 : 0주47냥2전3푼"
        ENDIF
    ELSEIF (args[0] == "열기")
        ojr_shopName = args[1]
        file = File("./plugins/TriggerReactor/ShopTrigger/"+ojr_shopName+".yml")
        yml = YamlConfiguration.loadConfiguration(file)
        IF (!file.exists())
            #MESSAGE {"ojr_prefix"} + "&4해당 상점은 존재하지 않습니다!"
            #STOP
        ENDIF
        shopId = yml.get("shopId") + ""
        shopIdToData = shopId.replaceAll("","§")
        shopDisplayName = yml.get("shopDisplayName")
        inventory = Bukkit.createInventory(null, 54, shopIdToData+"r§r§r§r§r"+shopDisplayName.replaceAll("&","§").replaceAll("\\^"," "))

        FOR i = 0:45
            IF (yml.get("shopItems."+i) != null)
                item = yml.get("shopItems."+i+".item")
                itemBuy = yml.get("shopItems."+i+".buy")
                itemSell = yml.get("shopItems."+i+".sell")
                addLore(item, "&6----------------------------")
                addLore(item, "&6 구매가격 : &d"+itemBuy)
                addLore(item, "&6 판매가격 : &d"+itemSell)
                addLore(item, "&6----------------------------")
                inventory.setItem(i, item)
            ENDIF
        ENDFOR

        description = item("BOOK", 1)
        setItemTitle(description, "&a상점 설명")
        addLore(description, "&6----------------------------")
        addLore(description, "&6 좌클릭 : &a구매")
        addLore(description, "&6 우믈릭 : &a판매")
        addLore(description, "&6 쉬프트+우클릭 : &a모두 판매")
        addLore(description, "&6----------------------------")
        inventory.setItem(48, description)

        player.openInventory(inventory)
    ENDIF
ELSEIF (args.length == 3)
// /상점 추가 <상점아이디> <상점이름>
    IF (args[0] == "추가")
        ojr_shopname_toadd = args[1]
        ojr_shopdisplayname_toadd = args[2]
        
        IF (!ojr_shopname_toadd.matches("^[a-zA-Z0-9]*\$"))
            #MESSAGE {"ojr_prefix"} + "&4상점 이름은 영문과 숫자만 가능합니다."
            #STOP
        ENDIF

        shop = File("./plugins/TriggerReactor/ShopTrigger/"+ojr_shopname_toadd+".yml")
        yml = YamlConfiguration.loadConfiguration(shop)
        IF (shop.exists())
            #MESSAGE {"ojr_prefix"} + "&4이미 존재하는 상점입니다."
            #STOP
        ENDIF
        shopId = configYml.get("shopCount")
        yml.set("shopId", shopId)
        yml.set("shopPage", 1)
        yml.set("shopDisplayName", ojr_shopdisplayname_toadd)
        yml.set("shopItems", list())
        yml.save(shop)
        configYml.set("shopCount", shopId + 1)
        configYml.set("shopList."+shopId+".shopName", ojr_shopname_toadd)
        configYml.save(configFile)
        #MESSAGE {"ojr_prefix"} + "&e" + ojr_shopname_toadd + "(" + ojr_shopdisplayname_toadd + ")&f(이)가 추가되었습니다."
    ENDIF
ELSEIF (args.length == 5)
    IF (args[0] == "아이템")
        IF (args[1] == "삭제")
            ojr_shopName = args[2]
            ojr_shopPage = args[3]
            ojr_shopIndex = args[4]
            file = File("./plugins/TriggerReactor/ShopTrigger/"+ojr_shopName+".yml")
            yml = YamlConfiguration.loadConfiguration(file)

            IF (!file.exists())
                #MESSAGE {"ojr_prefix"} + "&e" + ojr_shopName + "&4은 존재하지 않습니다!"
                #STOP
            ENDIF
            IF (!$isnumber:ojr_shopPage)
                #MESSAGE {"ojr_prefix"} + "&4페이지는 숫자만 가능합니다! &c(입력 : " + ojr_shopPage + ")"
                #STOP
            ENDIF
            IF (!$isnumber:ojr_shopIndex)
                #MESSAGE {"ojr_prefix"} + "&4슬롯 번호는 숫자만 가능합니다!"
                #STOP
            ELSE
                ojr_shopIndex = parseInt(ojr_shopIndex) - 1
            ENDIF
            IF (ojr_shopIndex < 0 || ojr_shopIndex > 36)
                #MESSAGE {"ojr_prefix"} + "&e" + args[4] + "&4번 칸은 설정이 불가능한 칸입니다."
                #STOP
            ENDIF
            IF (yml.get("shopPage") < parseInt(ojr_shopPage))
                #MESSAGE {"ojr_prefix"} + "&4해당 페이지는 존재하지 않습니다!"
                #STOP
            ENDIF
            ojr_shopIndex = ((parseInt(ojr_shopPage) - 1) * 45) + ojr_shopIndex
            IF (yml.get("shopItems."+ojr_shopIndex) == null)
                #MESSAGE {"ojr_prefix"} + "&4해당 칸에는 아이템이 존재하지 않습니다!"
                #STOP
            ENDIF
            IF (yml.get("shopPage") == ojr_shopPage)
                startCount = ((parseInt(ojr_shopPage) - 1) * 45)
                FOR i = startCount:(startCount+45)
                    IF (yml.get("shopItems."+i) != null)
                        #BREAK
                    ENDIF
                ENDFOR
                yml.set("shopPage", parseInt(ojr_shopPage) - 1)
            ENDIF
            yml.set("shopItems."+ojr_shopIndex, null)
            yml.save(file)
            #MESSAGE {"ojr_prefix"} + "&b" + ojr_shopName + "&2상점의 &b" + ojr_shopPage + "&2페이지 &b" + args[4] + "&2번 칸의 아이템이 삭제되었습니다."
        ELSEIF (args[1] == "등록")
            shopName = args[2]
            shopPage = args[3]
            shopIndex = args[4]
            {$helditemname + ".itemBuy"} = "설정되지 않음"
            {$helditemname + ".itemSell"} = "설정되지 않음"
            item = $helditem
            file = File("./plugins/TriggerReactor/ShopTrigger/"+shopName+".yml")
            yml = YamlConfiguration.loadConfiguration(file)

            IF (!file.exists())
                #MESSAGE {"ojr_prefix"} + "&4해당 상점은 존재하지 않습니다."
                #STOP
            ENDIF
            IF (!$isnumber:shopPage)
                #MESSAGE {"ojr_prefix"} + "&4페이지 번호는 숫자만 가능합니다!"
                #STOP
            ELSE
                shopPage = parseInt(shopPage)
            ENDIF
            IF (!$isnumber:shopIndex)
                #MESSAGE {"ojr_prefix"} + "&4슬롯 번호는 숫자만 가능합니다!"
                #STOP
            ELSE
                shopIndex = parseInt(shopIndex) - 1
            ENDIF
            IF (shopIndex < 0 || shopIndex > 35)
                #MESSAGE {"ojr_prefix"} + "&4" + (shopIndex+1) + "번 슬롯으로 설정이 불가능합니다!"
                #STOP
            ENDIF
            IF (item.getType().toString() == "AIR")
                #MESSAGE {"ojr_prefix"} + "&4손에 아무것도 들고 있지 않습니다!"
                #STOP
            ENDIF

            IF ({$helditemname + ".itemCost_set"} == "true")
                yml.set("shopItems."+shopIndex+".buy", {$helditemname + ".itemBuy"})
                yml.set("shopItems."+shopIndex+".sell", {$helditemname + ".itemSell"})
                yml.set("shopItems."+shopIndex+".item", item)
                yml.save(file)
                #MESSAGE {"ojr_prefix"} + "&b" + shopName + "&6상점의 &b" + shopPage + "&6번 페이지, &b" + (shopIndex+1) + "&6번 슬롯에 &b" + item.getType().toString() + "&6(을)를 추가하였습니다."

                {$helditemname + ".itemCost_set"} = "false"
            ENDIF

            {$playername + ".command_shopName"} = shopName
            {$playername + ".command_shopPage"} = shopPage
            {$playername + ".command_shopIndex"} = shopIndex + 1

            IF ({$helditemname + ".itemCost_set"} == "false" || {$helditemname + ".itemCost_set"} == null)    
                #CMDOP "trg i 가격설정 open"
            ENDIF
        ENDIF        
    ENDIF
ENDIF
