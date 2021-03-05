Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 64DBE32EEFC
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Mar 2021 16:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614958597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nvMg/AQ5XRB7ekITktw4hh5n1jYA4/Jb0AIwaU3lI0Q=;
	b=aj/1jthJraRNGodrVXclVL+TLcjYF36eOaCxkcQXIx+GSR/6yhFQGUMDsUfq7yXWui87OC
	q0GlFzwY+fMtKkHCFE/bC6SgYhkfitsc92wDrGm8qeHOKMafU/ZLpn7HrAWzLFwqLHhRoh
	t75zf4a1TFyIvThB7JbAtdfQQox7/1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-kpsgBDNfPbq3001cJTJ4Ww-1; Fri, 05 Mar 2021 10:36:35 -0500
X-MC-Unique: kpsgBDNfPbq3001cJTJ4Ww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E30169736;
	Fri,  5 Mar 2021 15:36:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E8D26B8DA;
	Fri,  5 Mar 2021 15:36:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A2F21809C86;
	Fri,  5 Mar 2021 15:36:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 125FaOWX006149 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Mar 2021 10:36:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 139C7110998D; Fri,  5 Mar 2021 15:36:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E87011099AD
	for <cluster-devel@redhat.com>; Fri,  5 Mar 2021 15:36:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3C6D800B30
	for <cluster-devel@redhat.com>; Fri,  5 Mar 2021 15:36:19 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
	[209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-250-hQ6Jxv_ePD65a4RPgt76hw-1; Fri, 05 Mar 2021 10:36:17 -0500
X-MC-Unique: hQ6Jxv_ePD65a4RPgt76hw-1
Received: by mail-io1-f71.google.com with SMTP id x26so2255381ior.7
	for <cluster-devel@redhat.com>; Fri, 05 Mar 2021 07:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nvMg/AQ5XRB7ekITktw4hh5n1jYA4/Jb0AIwaU3lI0Q=;
	b=BEq+hlOhfN1cCmgPjHWxHK1PLK5LMW2isUofif7j1uT9jtyWBLNDIME4VHLWNyXlml
	8rPsOdvxPyvnRqnt32wDgGe44ULjOcmKR18v2HluPvi3moMSsNHkTB3lI1bxS2TJ3NX0
	3MqLpsKQqvkuv1XNGohUCDuaoeYO3BoOkzLPWtoyOAty8m11T/QZbtyPu20VJ34RCipf
	VPhI6Ncprs+mVUY98m5Sw/JsDBhiMLbTp23twgdASVxsCPuQ5lxribsXOEHtM0YE7JUJ
	heCvwbvrFpn1aSp7XdDX/I+FoBm/Pz22iOSJ6rBmj/cclKlFLZ+TUb1NiRJeO/ahvZ/X
	kQiA==
X-Gm-Message-State: AOAM531bGC581qTDe7evigV9AZIrCEweQ85xvWp6LzkK7WEswuQTho6V
	d3fXmiNfSnbOF4hUYBx53XYzij1s2/MvORBrELKuBAO7dumLSDIvrLJ7GKbWKinfuLE4e100Hi0
	w4wusgijWPZL+8NBZgYJaEKUp3nLEiAe2imk1gQ==
X-Received: by 2002:a02:c6b4:: with SMTP id o20mr10595449jan.124.1614958575393;
	Fri, 05 Mar 2021 07:36:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW2nH+wXELpexGLMzwu6wWkRKQxoyFU9nm/kkwLCATwpPBltJaSzaYs1Kch2s7GhxPj4XL3XBRgLI7TbrtWho=
X-Received: by 2002:a02:c6b4:: with SMTP id o20mr10595303jan.124.1614958573550;
	Fri, 05 Mar 2021 07:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20210304195638.32799-1-aahringo@redhat.com>
	<20210304195638.32799-8-aahringo@redhat.com>
	<1cdc93061dac2b497c8e128896521e559d3a9ab1.camel@redhat.com>
In-Reply-To: <1cdc93061dac2b497c8e128896521e559d3a9ab1.camel@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Fri, 5 Mar 2021 10:36:02 -0500
Message-ID: <CAK-6q+gWMf3WG2UU69O4+RM9CY_af+FMg+aoq-QF1vj2SngJqw@mail.gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Guillaume Nault <gnault@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Mar 5, 2021 at 9:31 AM Paolo Abeni <pabeni@redhat.com> wrote:
>
> Hello,
>
> First thing first, overall this series looks little related to the
> networking scope, and a I feel like I lack some of the context, anyway
> let me add some early comments. Please perdom me for the possibly naive
> questions.
>
> Do you have a git tree available with this series applied?
>

No, but maybe I can do it with the new gitlab workflow and upload it
there. It's based on dlm next branch on [0]. Please report if there
are any problems to apply these patches.

> On Thu, 2021-03-04 at 14:56 -0500, Alexander Aring wrote:
> > This patch introduce to make a tcp lowcomms connection reliable even if
> > reconnects occurs. This is done by an application layer re-transmission
> > handling and sequence numbers in dlm protocols. There are three new dlm
> > commands:
> >
> > DLM_OPTS:
> >
> > This will encapsulate an existing dlm message (and rcom message if they
> > don't have an own application side re-transmission handling). As optional
> > handling additional tlv's (type length fields) can be appended. This can
> > be for example a sequence number field. However because in DLM_OPTS the
> > lockspace field is unused and a sequence number is a mandatory field it
> > isn't made as a tlv and we put the sequence number inside the lockspace
> > id. The possibility to add optional options are still there for future
> > purposes.
> >
> > DLM_ACK:
> >
> > Just a dlm header to acknowledge the receive of a DLM_OPTS message to
> > it's sender.
> >
> > DLM_FIN:
> >
> > A new DLM message to synchronize pending message to the other dlm end if
> > the node want to disconnects. Each side waits until it receives this
> > message and disconnects. It's important that this message has nothing to
> > do with the application logic because it might run in a timeout if
> > acknowledge messages are dropped. The problem which we try to solve with
> > DLM_FIN is that the node membership is handled by corosync and not the
> > kernel dlm protocol itself, DLM_FIN tries to synchronize the kernel dlm
> > protocol with corosync join/leave membership callbacks.
>
> Looks like this patch defines new messages on the wire, are there any
> existing public RFC/specs for that? Or is something completely new with
> this patchset?
>

No, it's a protocol based on a closed protocol in OpenVMS. Note that
"Open" doesn't mean anything related to Open Source or Open standard.
I did these extensions because of an old issue [1] from my mind and on
my own.

> [...]
> > diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
> > index bf5c55ef9d0d..2b738be8d7e4 100644
> > --- a/fs/dlm/lockspace.c
> > +++ b/fs/dlm/lockspace.c
> > @@ -567,7 +567,12 @@ static int new_lockspace(const char *name, const char *cluster,
> >       mutex_init(&ls->ls_requestqueue_mutex);
> >       mutex_init(&ls->ls_clear_proc_locks);
> >
> > -     ls->ls_recover_buf = kmalloc(LOWCOMMS_MAX_TX_BUFFER_LEN, GFP_NOFS);
> > +     /* Due backwards compatibility with 3.1 we need to use maximum
> > +      * possible dlm message size to be sure the message will fit and
> > +      * not having out of bounds issues. However on sending side 3.2
> > +      * might send less.
> > +      */
> > +     ls->ls_recover_buf = kmalloc(DEFAULT_BUFFER_SIZE, GFP_NOFS);
>
> in current net-next DEFAULT_BUFFER_SIZE == LOWCOMMS_MAX_TX_BUFFER_LEN
> == 4096, so I'm likely missing some bits here...
>

LOWCOMMS_MAX_TX_BUFFER_LEN is updated in this patch and defines a new
application level maximum buffer size because we encapsulate a header
below it.
I agree these names are somehow misnamed but it is as it is currently.

> [...]
>
> > + * Unaligned memory access:
> > + *
> > + * There exists cases when the dlm message buffer length is not aligned
> > + * to 8 byte. However seems nobody detected any problem with it. This
> > + * can be fixed in the next major version bump of dlm.
>
> Do you mean dlm_header 'h_length'? that should not be a problem, since
> the field size is 16 bits. Or is something else?
>

No, I mean every field is 8 byte aligned, which is fine. However there
exists ways (triggered by userspace) to send a dlm message out with a
tail message payload of size which is not 8 byte aligned.
This makes problems at:

1. sending side due an internal buffer allocation mechanism which uses
next available space in a page buffer and this ends in an unaligned
pointer for the next message.
2. receiving side that we get an unaligned pointer while parsing that
message and pointing to the next message.

> [...]
>
> > -void *dlm_midcomms_get_buffer(int nodeid, int len, gfp_t allocation, char **ppc)
> > +/* init value for sequence numbers for testing purpose only e.g. overflows */
> > +#define DLM_SEQ_INIT         0
> > +/* if we get duplicates amount of acks we will start retransmit */
> > +#define DLM_RETRANS_ACK_COUNT        3
> > +/* timer timeout to start retransmit if we don't get an ack back */
> > +#define DLM_RTO                      msecs_to_jiffies(15 * 1000)
> > +#define DLM_RTO_TIMER                msecs_to_jiffies(30 * 1000)
>
> This looks like a very high timeout. How long is the expected average
> time to serve a single request?
>

The response time depends on their networking setup. I think we should
not take care about an "expected average time to server" here, the
more interesting part to choose the right timeout value here are the
default timeouts of the cluster world, which are making assumptions
about "expected average time to server" as well.

> > +/* 5 minutes wait to sync ending of dlm */
> > +#define DLM_QUEUE_TIMEOUT    msecs_to_jiffies(5 * 60 * 1000)
> > +#define DLM_VERSION_NOT_SET  0
> > +
> > +struct midcomms_node {
> > +     int nodeid;
> > +     uint32_t version;
> > +     uint32_t seq_send;
> > +     uint32_t seq_next;
> > +     uint32_t seq_last;
> > +     /* note: this list may not sorted according to their seq */
> > +     struct list_head send_queue;
> > +     struct list_head recv_queue;
> > +     spinlock_t send_queue_lock;
> > +     atomic_t send_queue_cnt;
> > +     atomic_t recv_queue_cnt;
> > +#define DLM_NODE_FLAG_FIN    1
> > +#define DLM_NODE_FLAG_CLOSE  2
> > +#define DLM_NODE_FLAG_STOP_TX        3
> > +     unsigned long flags;
> > +     wait_queue_head_t fin_wait;
> > +     /* counts how many lockspaces are using this node
> > +      * this refcount is necessary to determine if the
> > +      * node wants to disconnect.
> > +      */
> > +     int users;
> > +
> > +     struct hlist_node hlist;
> > +     struct rcu_head rcu;
> > +};
> > +
> > +struct dlm_send_msg {
> > +     const struct dlm_header *inner_hd;
> > +     struct midcomms_node *node;
> > +     struct dlm_opts *opts;
> > +     unsigned long timeout;
> > +     int ack_count;
> > +     uint32_t seq;
> > +     void *mh;
> > +
> > +     struct list_head list;
> > +     struct rcu_head rcu;
> > +};
> > +
> > +struct dlm_recv_msg {
> > +     union dlm_packet *p;
> > +     uint32_t seq;
> > +
> > +     struct list_head list;
> > +};
> > +
> > +static struct timer_list dlm_retransmit_timer;
> > +
> > +static struct hlist_head node_hash[CONN_HASH_SIZE];
> > +static DEFINE_SPINLOCK(nodes_lock);
> > +DEFINE_STATIC_SRCU(nodes_srcu);
> > +
> > +/* This mutex prevents that midcomms_close() is running while
> > + * stop() or remove(). As I experienced invalid memory access
> > + * behaviours when DLM_DEBUG_FENCE_TERMINATION is enabled and
> > + * resetting machines. I will end in some double deletion in nodes
> > + * datastructure.
> > + */
> > +static DEFINE_MUTEX(close_lock);
> > +
> > +static struct midcomms_node *__find_node(int nodeid, int r)
> >  {
> > -     return dlm_lowcomms_new_buffer(nodeid, len, allocation, ppc, NULL,
> > -                                    NULL);
> > +     struct midcomms_node *node;
> > +     int idx;
> > +
> > +     idx = srcu_read_lock(&nodes_srcu);
> > +     hlist_for_each_entry_rcu(node, &node_hash[r], hlist) {
> > +             if (node->nodeid == nodeid) {
> > +                     srcu_read_unlock(&nodes_srcu, idx);
> > +                     return node;
> > +             }
> > +     }
> > +     srcu_read_unlock(&nodes_srcu, idx);
> > +
> > +     return NULL;
> >  }
> >
> > -void dlm_midcomms_commit_buffer(void *mh)
> > +static struct midcomms_node *nodeid2node(int nodeid, gfp_t alloc)
> >  {
> > -     dlm_lowcomms_commit_buffer(mh);
> > -     dlm_lowcomms_put_buffer(mh);
> > +     struct midcomms_node *node, *tmp;
> > +     int r = nodeid_hash(nodeid);
> > +
> > +     node = __find_node(nodeid, r);
> > +     if (node || !alloc)
> > +             return node;
>
> This apparently returns a reference to a 'midcomms_node *' with no
> additional lock nor rcu held.
>

Yes, it will not hold any rcu. The whole mechanism works because the
hotpath for a specific node will not run concurrent while removing and
freeing the node.

> AFAICS concurrent midcomms_remove_member() could delete and free the
> node at any moment after this point.
>
> In pratice that should be difficult to reproduce, but I guess syzkaller
> with time could hit that - assuming cuncurrent midcomms_remove_member()
> are possible at all.
>

Assuming that happens, it is a bug in other places as well. The
hotpath for the specific node should not run anymore when midcomms is
attempting to delete the specific node. To ensure this I could maybe
add more WARN_ON and some flags?

> [...]
>
> > +static void dlm_receive_ack(struct midcomms_node *node, uint32_t seq)
> > +{
> > +     struct dlm_send_msg *msg;
> > +
> > +     rcu_read_lock();
> > +     if (seq < node->seq_last) {
> > +             log_print("dlm seq overflow detected from node %d",
> > +                       node->nodeid);
> > +             dlm_overflow_upper_ack(node);
> > +     }
>
> I think this can be simplified using the 'before()' and 'after()'
> function/macro from include/net/tcp.h to compare seq and msg->seq,
> without explicitly checking for overflow and without storing the
> previous ack in 'seq_last'.
>

Okay, thanks I was looking for a simpler solution for that.

> > +
> > +     list_for_each_entry_rcu(msg, &node->send_queue, list) {
> > +             if (msg->seq < seq) {
> > +                     spin_lock(&node->send_queue_lock);
> > +                     dlm_send_msg_del(node, msg);
> > +                     spin_unlock(&node->send_queue_lock);
> > +             } else if (msg->seq == seq) {
> > +                     msg->ack_count++;
> > +                     if (msg->ack_count >= DLM_RETRANS_ACK_COUNT) {
> > +                             log_print("retransmit because multiple acks received. message seq %u, nodeid: %d",
> > +                                       seq, node->nodeid);
> > +                             dlm_lowcomms_resend_buffer(msg->mh);
> > +                     }
> > +             }
> > +     }
> > +     rcu_read_unlock();
> > +
> > +     /* for overflow detection */
> > +     node->seq_last = seq;
> > +}
>
> [...]
>
> > +static int dlm_recv_queue_future_msg(struct midcomms_node *node,
> > +                                  const union dlm_packet *p,
> > +                                  uint32_t seq)
> > +{
> > +     struct dlm_recv_msg *msg;
> > +
> > +     /* check if we already got the message */
> > +     msg = dlm_recv_get_msg_by_seq(node, seq);
> > +     if (msg)
> > +             return 0;
> > +
> > +     log_print("received message for the future, will queue it. expected seq: %u, message seq: %u, nodeid: %d",
> > +               node->seq_next, seq, node->nodeid);
> > +
> > +     msg = dlm_recv_create_msg(p, seq);
> > +     if (!msg)
> > +             return -ENOMEM;
> > +
> > +     atomic_inc(&node->recv_queue_cnt);
> > +     list_add_tail(&msg->list, &node->recv_queue);
>
> It looks like the amount of 'future' msg is unbounded. An evil or
> bugged peer may cause the allocation of unlimited amount of memory
> sending messages with high/out-of-sequence seq number.
>
> TCP uses quite a bit of complexity to deal with the above - limiting
> the amount of allocated memory per connection and trimming out-of-
> sequence data under memory pressure.
>
> But looks like dlm_process_incoming_buffer() happens
> after kernel_recvmsg(), so this receive memory is not accounted anymore
> by TCP. I guess some similar constraint should be applied here (e.g.
> enqueue at most X messages).
>
> I think a similar issue potentially exists on the sender side
>
> Side note: if the 'future' msg list become very long (still due to
> buggy or evil peer) traversing it could become costly, but looks like
> the traversing happens in process context, so that should be not very
> critical.
>

Yes, this whole concept works on trusted nodes/networking only. A
bugged peer hopefully gets fenced by corosync because of other
reasons. For now it's a very simple mechanism and I didn't put a lot
of TCP engineering of the last decades into it.

If such a thing happens I might be able to send a signal to corosync
to fence the peer?

> [...]
>
> > +int dlm_midcomms_start(void)
> > +{
> > +     int i, ret;
> > +
> > +     for (i = 0; i < CONN_HASH_SIZE; i++)
> > +             INIT_HLIST_HEAD(&node_hash[i]);
> > +
> > +     ret = dlm_lowcomms_start();
> > +     if (ret == 0) {
> > +             timer_setup(&dlm_retransmit_timer,
> > +                         dlm_retransmit_timer_expires, TIMER_DEFERRABLE);
> > +             mod_timer(&dlm_retransmit_timer,
> > +                       jiffies + DLM_RTO_TIMER);
>
> It looks like the timer is never updated, that is, it will fire even
> all the outstanding msgs are acked.
>
> Should not be a problem anyway.
>

Yes, I can change it to fire the timer only if drops are detected. I
will do that.

Thanks.

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git/log/?h=next
[1] https://bugzilla.redhat.com/show_bug.cgi?id=1162846

