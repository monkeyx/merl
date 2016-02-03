

# Module merl_protocol #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

__Behaviours:__ [`ranch_protocol`](ranch_protocol.md).

<a name="types"></a>

## Data Types ##




### <a name="type-opts">opts()</a> ###


<pre><code>
opts() = []
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#init-4">init/4</a></td><td>initialises the protocol.</td></tr><tr><td valign="top"><a href="#start_link-4">start_link/4</a></td><td>starts the listeners.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="init-4"></a>

### init/4 ###

<pre><code>
init(Ref::<a href="ranch.md#type-ref">ranch:ref()</a>, Socket::<a href="inet.md#type-socket">inet:socket()</a>, Transport::module(), Opts::<a href="#type-opts">opts()</a>) -&gt; ok
</code></pre>
<br />

initialises the protocol

<a name="start_link-4"></a>

### start_link/4 ###

`start_link(Ref, Socket, Transport, Opts) -> any()`

starts the listeners

