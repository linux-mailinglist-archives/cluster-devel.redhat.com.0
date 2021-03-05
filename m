Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 15C0132ED35
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Mar 2021 15:35:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614954936;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Zu+plG+eY/Hq/kl0E4kwb5G21vL20A7MQch4JC9Hrdc=;
	b=KPUau2N1tbTLgooxgvNSCz3YNS23McrAgPZiX4xdC6ZGj6EAk3AFyqNSr1ZoJ8bNBEkpc1
	WzUIHA92diA8AvzXwehQz+TC8e0wcjCq+Nkvo/0l3gxalL46O2lzxPbmJ9Nqw7llAteTq7
	lIAqK1G+VKowU+16itfRCSWhjrogBj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-kB8mZiNQPz2S3BNCu_HgVg-1; Fri, 05 Mar 2021 09:35:09 -0500
X-MC-Unique: kB8mZiNQPz2S3BNCu_HgVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C95521940925;
	Fri,  5 Mar 2021 14:35:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94D4A19726;
	Fri,  5 Mar 2021 14:35:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43F715002F;
	Fri,  5 Mar 2021 14:35:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 125EVCXG032208 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Mar 2021 09:31:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 189095D719; Fri,  5 Mar 2021 14:31:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from ovpn-114-96.ams2.redhat.com (ovpn-114-96.ams2.redhat.com
	[10.36.114.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7C005D6B1;
	Fri,  5 Mar 2021 14:31:10 +0000 (UTC)
Message-ID: <1cdc93061dac2b497c8e128896521e559d3a9ab1.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Alexander Aring <aahringo@redhat.com>, teigland@redhat.com
Date: Fri, 05 Mar 2021 15:31:09 +0100
In-Reply-To: <20210304195638.32799-8-aahringo@redhat.com>
References: <20210304195638.32799-1-aahringo@redhat.com>
	<20210304195638.32799-8-aahringo@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 05 Mar 2021 09:34:52 -0500
Cc: cluster-devel@redhat.com, gnault@redhat.com
Subject: Re: [Cluster-devel] [PATCH dlm/next 7/8] fs: dlm: add reliable
 connection if reconnect
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

First thing first, overall this series looks little related to the
networking scope, and a I feel like I lack some of the context, anyway
let me add some early comments. Please perdom me for the possibly naive
questions.

Do you have a git tree available with this series applied?

On Thu, 2021-03-04 at 14:56 -0500, Alexander Aring wrote:
> This patch introduce to make a tcp lowcomms connection reliable even if
> reconnects occurs. This is done by an application layer re-transmission
> handling and sequence numbers in dlm protocols. There are three new dlm
> commands:
> 
> DLM_OPTS:
> 
> This will encapsulate an existing dlm message (and rcom message if they
> don't have an own application side re-transmission handling). As optional
> handling additional tlv's (type length fields) can be appended. This can
> be for example a sequence number field. However because in DLM_OPTS the
> lockspace field is unused and a sequence number is a mandatory field it
> isn't made as a tlv and we put the sequence number inside the lockspace
> id. The possibility to add optional options are still there for future
> purposes.
> 
> DLM_ACK:
> 
> Just a dlm header to acknowledge the receive of a DLM_OPTS message to
> it's sender.
> 
> DLM_FIN:
> 
> A new DLM message to synchronize pending message to the other dlm end if
> the node want to disconnects. Each side waits until it receives this
> message and disconnects. It's important that this message has nothing to
> do with the application logic because it might run in a timeout if
> acknowledge messages are dropped. The problem which we try to solve with
> DLM_FIN is that the node membership is handled by corosync and not the
> kernel dlm protocol itself, DLM_FIN tries to synchronize the kernel dlm
> protocol with corosync join/leave membership callbacks.

Looks like this patch defines new messages on the wire, are there any
existing public RFC/specs for that? Or is something completely new with
this patchset?

[...]
> diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
> index bf5c55ef9d0d..2b738be8d7e4 100644
> --- a/fs/dlm/lockspace.c
> +++ b/fs/dlm/lockspace.c
> @@ -567,7 +567,12 @@ static int new_lockspace(const char *name, const char *cluster,
>  	mutex_init(&ls->ls_requestqueue_mutex);
>  	mutex_init(&ls->ls_clear_proc_locks);
>  
> -	ls->ls_recover_buf = kmalloc(LOWCOMMS_MAX_TX_BUFFER_LEN, GFP_NOFS);
> +	/* Due backwards compatibility with 3.1 we need to use maximum
> +	 * possible dlm message size to be sure the message will fit and
> +	 * not having out of bounds issues. However on sending side 3.2
> +	 * might send less.
> +	 */
> +	ls->ls_recover_buf = kmalloc(DEFAULT_BUFFER_SIZE, GFP_NOFS);

in current net-next DEFAULT_BUFFER_SIZE == LOWCOMMS_MAX_TX_BUFFER_LEN
== 4096, so I'm likely missing some bits here...

[...]

> + * Unaligned memory access:
> + *
> + * There exists cases when the dlm message buffer length is not aligned
> + * to 8 byte. However seems nobody detected any problem with it. This
> + * can be fixed in the next major version bump of dlm.

Do you mean dlm_header 'h_length'? that should not be a problem, since
the field size is 16 bits. Or is something else?

[...]

> -void *dlm_midcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
> +/* init value for sequence numbers for testing purpose only e.g. overflows */
> +#define DLM_SEQ_INIT		0
> +/* if we get duplicates amount of acks we will start retransmit */
> +#define DLM_RETRANS_ACK_COUNT	3
> +/* timer timeout to start retransmit if we don't get an ack back */
> +#define DLM_RTO			msecs_to_jiffies(15 * 1000)
> +#define DLM_RTO_TIMER		msecs_to_jiffies(30 * 1000)

This looks like a very high timeout. How long is the expected average
time to serve a single request?

> +/* 5 minutes wait to sync ending of dlm */
> +#define DLM_QUEUE_TIMEOUT	msecs_to_jiffies(5 * 60 * 1000)
> +#define DLM_VERSION_NOT_SET	0
> +
> +struct midcomms_node {
> +	int nodeid;
> +	uint32_t version;
> +	uint32_t seq_send;
> +	uint32_t seq_next;
> +	uint32_t seq_last;
> +	/* note: this list may not sorted according to their seq */
> +	struct list_head send_queue;
> +	struct list_head recv_queue;
> +	spinlock_t send_queue_lock;
> +	atomic_t send_queue_cnt;
> +	atomic_t recv_queue_cnt;
> +#define DLM_NODE_FLAG_FIN	1
> +#define DLM_NODE_FLAG_CLOSE	2
> +#define DLM_NODE_FLAG_STOP_TX	3
> +	unsigned long flags;
> +	wait_queue_head_t fin_wait;
> +	/* counts how many lockspaces are using this node
> +	 * this refcount is necessary to determine if the
> +	 * node wants to disconnect.
> +	 */
> +	int users;
> +
> +	struct hlist_node hlist;
> +	struct rcu_head rcu;
> +};
> +
> +struct dlm_send_msg {
> +	const struct dlm_header *inner_hd;
> +	struct midcomms_node *node;
> +	struct dlm_opts *opts;
> +	unsigned long timeout;
> +	int ack_count;
> +	uint32_t seq;
> +	void *mh;
> +
> +	struct list_head list;
> +	struct rcu_head rcu;
> +};
> +
> +struct dlm_recv_msg {
> +	union dlm_packet *p;
> +	uint32_t seq;
> +
> +	struct list_head list;
> +};
> +
> +static struct timer_list dlm_retransmit_timer;
> +
> +static struct hlist_head node_hash[CONN_HASH_SIZE];
> +static DEFINE_SPINLOCK(nodes_lock);
> +DEFINE_STATIC_SRCU(nodes_srcu);
> +
> +/* This mutex prevents that midcomms_close() is running while
> + * stop() or remove(). As I experienced invalid memory access
> + * behaviours when DLM_DEBUG_FENCE_TERMINATION is enabled and
> + * resetting machines. I will end in some double deletion in nodes
> + * datastructure.
> + */
> +static DEFINE_MUTEX(close_lock);
> +
> +static struct midcomms_node *__find_node(int nodeid, int r)
>  {
> -	return dlm_lowcomms_new_buffer(nodeid, len, allocation, ppc, NULL,
> -				       NULL);
> +	struct midcomms_node *node;
> +	int idx;
> +
> +	idx = srcu_read_lock(&nodes_srcu);
> +	hlist_for_each_entry_rcu(node, &node_hash[r], hlist) {
> +		if (node->nodeid == nodeid) {
> +			srcu_read_unlock(&nodes_srcu, idx);
> +			return node;
> +		}
> +	}
> +	srcu_read_unlock(&nodes_srcu, idx);
> +
> +	return NULL;
>  }
>  
> -void dlm_midcomms_commit_buffer(void *mh)
> +static struct midcomms_node *nodeid2node(int nodeid, gfp_t alloc)
>  {
> -	dlm_lowcomms_commit_buffer(mh);
> -	dlm_lowcomms_put_buffer(mh);
> +	struct midcomms_node *node, *tmp;
> +	int r = nodeid_hash(nodeid);
> +
> +	node = __find_node(nodeid, r);
> +	if (node || !alloc)
> +		return node;

This apparently returns a reference to a 'midcomms_node *' with no
additional lock nor rcu held.

AFAICS concurrent midcomms_remove_member() could delete and free the
node at any moment after this point.

In pratice that should be difficult to reproduce, but I guess syzkaller
with time could hit that - assuming cuncurrent midcomms_remove_member()
are possible at all.

[...]

> +static void dlm_receive_ack(struct midcomms_node *node, uint32_t seq)
> +{
> +	struct dlm_send_msg *msg;
> +
> +	rcu_read_lock();
> +	if (seq < node->seq_last) {
> +		log_print("dlm seq overflow detected from node %d",
> +			  node->nodeid);
> +		dlm_overflow_upper_ack(node);
> +	}

I think this can be simplified using the 'before()' and 'after()'
function/macro from include/net/tcp.h to compare seq and msg->seq,
without explicitly checking for overflow and without storing the
previous ack in 'seq_last'.

> +
> +	list_for_each_entry_rcu(msg, &node->send_queue, list) {
> +		if (msg->seq < seq) {
> +			spin_lock(&node->send_queue_lock);
> +			dlm_send_msg_del(node, msg);
> +			spin_unlock(&node->send_queue_lock);
> +		} else if (msg->seq == seq) {
> +			msg->ack_count++;
> +			if (msg->ack_count >= DLM_RETRANS_ACK_COUNT) {
> +				log_print("retransmit because multiple acks received. message seq %u, nodeid: %d",
> +					  seq, node->nodeid);
> +				dlm_lowcomms_resend_buffer(msg->mh);
> +			}
> +		}
> +	}
> +	rcu_read_unlock();
> +
> +	/* for overflow detection */
> +	node->seq_last = seq;
> +}

[...]

> +static int dlm_recv_queue_future_msg(struct midcomms_node *node,
> +				     const union dlm_packet *p,
> +				     uint32_t seq)
> +{
> +	struct dlm_recv_msg *msg;
> +
> +	/* check if we already got the message */
> +	msg = dlm_recv_get_msg_by_seq(node, seq);
> +	if (msg)
> +		return 0;
> +
> +	log_print("received message for the future, will queue it. expected seq: %u, message seq: %u, nodeid: %d",
> +		  node->seq_next, seq, node->nodeid);
> +
> +	msg = dlm_recv_create_msg(p, seq);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	atomic_inc(&node->recv_queue_cnt);
> +	list_add_tail(&msg->list, &node->recv_queue);

It looks like the amount of 'future' msg is unbounded. An evil or
bugged peer may cause the allocation of unlimited amount of memory
sending messages with high/out-of-sequence seq number.

TCP uses quite a bit of complexity to deal with the above - limiting
the amount of allocated memory per connection and trimming out-of-
sequence data under memory pressure.

But looks like dlm_process_incoming_buffer() happens
after kernel_recvmsg(), so this receive memory is not accounted anymore
by TCP. I guess some similar constraint should be applied here (e.g.
enqueue at most X messages).

I think a similar issue potentially exists on the sender side
 
Side note: if the 'future' msg list become very long (still due to
buggy or evil peer) traversing it could become costly, but looks like
the traversing happens in process context, so that should be not very
critical.

[...]

> +int dlm_midcomms_start(void)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < CONN_HASH_SIZE; i++)
> +		INIT_HLIST_HEAD(&node_hash[i]);
> +
> +	ret = dlm_lowcomms_start();
> +	if (ret == 0) {
> +		timer_setup(&dlm_retransmit_timer,
> +			    dlm_retransmit_timer_expires, TIMER_DEFERRABLE);
> +		mod_timer(&dlm_retransmit_timer,
> +			  jiffies + DLM_RTO_TIMER);

It looks like the timer is never updated, that is, it will fire even
all the outstanding msgs are acked.

Should not be a problem anyway.

Cheers,

Paolo

