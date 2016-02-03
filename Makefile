PROJECT = merl
PROJECT_DESCRIPTION = A Multi-User Dungeon (MUD) in Erlang/OTP
PROJECT_VERSION = 0.1.0
DEPS = ranch lager
DOC_DEPS = edown
EDOC_OPTS = {doclet, edown_doclet}
ERLC_OPTS := +debug_info +'{parse_transform, lager_transform}'
TEST_ERLC_OPTS += +debug_info +'{parse_transform, lager_transform}'

include erlang.mk
