from django import template
register = template.Library()

@register.filter
def pluck(queryset, key):
    """Extrai um campo de uma lista de dicionários (ex: top_livros|pluck:'livro__nome')"""
    return [obj.get(key) for obj in queryset]
