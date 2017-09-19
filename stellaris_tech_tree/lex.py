from pprint import pprint
from ply.lex import lex
import sys

tokens = ('BAREWORD', 'STRING', 'VARIABLE', 'NUMBER', 'EQUALS', 'GTHAN', 'LTHAN',
          'LBRACE', 'RBRACE')

t_EQUALS = '='
t_GTHAN = r'>'
t_LTHAN = r'<'
t_LBRACE = '{'
t_RBRACE = '}'
t_ignore = ' \t'

def lexed_tokens(lexer):
    tokens = []
    while True:
        token = lexer.token()
        if token is None:
            break
        tokens.append(token)

    return tokens


def t_comment(token):
    r'[#][^\r\n]*'
    pass


def t_newline(token):
    r'(?:\r?\n)+'
    token.lineno += len(token.value)


def t_BAREWORD(token):
    '[a-zA-Z][-\w.]*'
    return token


def t_VARIABLE(token):
    '@[a-z]\w*'
    return token


def t_STRING(token):
    r'\"([^\\"]|(\\.))*\"'
    escaped = 0
    str = token.value[1:-1]
    new_str = ""
    for i in range(0, len(str)):
        c = str[i]
        if escaped:
            if c == "n":
                c = "\n"
            elif c == "t":
                c = "\t"
            new_str += c
            escaped = 0
        else:
            if c == "\\":
                escaped = 1
            else:
                new_str += c
    token.value = new_str
    return token


def t_NUMBER(token):
    r'-?\d+(?:\.\d+)?'
    return token


def t_error(token):
    pprint("Illegal character '{}' on line {}".format(token.value[0], token.lineno))
    token.lexer.skip(1)


try:
    filename = sys.argv[1]
except IndexError:
    filename = 'test_data.txt'

lexer = lex()

if __name__ == '__main__':
    data = open(filename).read()
    lexer.input(data)
    lexed = lexed_tokens(lexer)
    pprint(lexed)
