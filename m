Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609E611C65
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Oct 2022 23:26:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666992369;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PGZAZJrpF9jss5AqfX30mQ8E6UpXH1QfOBqaVm4O/Qw=;
	b=DYRt0SSEoU/kLQZBsLjC6d7nqfxmwGbN9vBbCjKdwttQO2pcQjQb9utKeRvTTCqeJC84EY
	r+26hRDpgrp6/GEpJwjKvgma5L7v5RUzY8yDn6sB5w8r+V4k1IT9p6xOJ+CcU8NnKt8IXH
	P1VB0ZJRjnQvG7/D1Zf7U+BDzuZUm4c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-jDwkTt_yNe6b4lVBJLNUMQ-1; Fri, 28 Oct 2022 17:26:05 -0400
X-MC-Unique: jDwkTt_yNe6b4lVBJLNUMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F369886461;
	Fri, 28 Oct 2022 21:26:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23AD7C15BA8;
	Fri, 28 Oct 2022 21:26:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9FBB319466DF;
	Fri, 28 Oct 2022 21:26:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BC25E1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 21:26:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7B7821415117; Fri, 28 Oct 2022 21:26:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7419E1415102
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 21:26:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 586ED38041E2
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 21:26:01 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-po5VDDiGN_GbGHonnFFRug-1; Fri, 28 Oct 2022 17:25:59 -0400
X-MC-Unique: po5VDDiGN_GbGHonnFFRug-1
Received: by mail-ed1-f72.google.com with SMTP id
 b14-20020a056402278e00b004621a2642d7so4080219ede.1
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 14:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PGZAZJrpF9jss5AqfX30mQ8E6UpXH1QfOBqaVm4O/Qw=;
 b=cflCKsQRgD8UYMwyoApFcCCzBuzY5Q1Hgl9HzRemK69gjcXUgvxdfA9E/mLU1SZrxR
 uOASQYvJTGNA8ZL5C1s4jYC3JQVqgLDa/UR/Sd5fTYFxO5b94kRHmRpS/QF0oSWD8p3J
 6bNNhA0o4z/gGSTKhgVYEYVDllOc4FqsuOiZkjujXkgZL9lSCrJIpOkzZ5wsADH4KZBC
 0bdwhM98vnoNisbHfYHaxrR9Ltt9P8fpxTgtrnKIfUwsb6mawFRFxC/PY36efNVOYx++
 X6f463Fn2zI+bAj6eoKU5dbvcNMQRrrGJbQ8NlBQIonSutesuNtC0ct894pjInnRlDpW
 CYCA==
X-Gm-Message-State: ACrzQf2NzijvMfrsx8b907VIBXN8cZ6wdJbGHKAcnZVGbV530D+G7Y6e
 ITLUoj2/mTOrz/qFhd5TxRY8GUAH34VVEezdGqVFlWH/t6FvvPI/3rvvHrn9UXETroL/Vy7EHj1
 sOsAvCB8+AZ3BSi2oGLcKp31EmexWFgRt03yTjg==
X-Received: by 2002:a05:6402:1690:b0:45f:d702:9919 with SMTP id
 a16-20020a056402169000b0045fd7029919mr1389802edv.127.1666992358769; 
 Fri, 28 Oct 2022 14:25:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5V8C00pY9/2C0jRbKMRtlLAOyfC5HJwvI+zbhPLWPtobLvh+yO8ed2tEuog6bqggdGLv4HlrwRslqli3FwzY8=
X-Received: by 2002:a05:6402:1690:b0:45f:d702:9919 with SMTP id
 a16-20020a056402169000b0045fd7029919mr1389786edv.127.1666992358558; Fri, 28
 Oct 2022 14:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221027204528.1119036-1-aahringo@redhat.com>
 <20221027204528.1119036-18-aahringo@redhat.com>
In-Reply-To: <20221027204528.1119036-18-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 28 Oct 2022 17:25:47 -0400
Message-ID: <CAK-6q+hF4OGoCsz6m3hwq+S5K9T-2GqVukaeSrft74D=32VEtg@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH v6.1-rc1 18/18] fs: dlm: rework lowcomms
 handling
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Oct 27, 2022 at 4:45 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch is rework of lowcomms handling, the main goal was here to
> handle recvmsg() and sendpage() to run parallel. Parallel in two sense:
> 1. per connection and 2. that recvmsg()/sendpage() doesn't block each
> other.
>
> Currently recvmsg()/sendpage() cannot run parallel because two
> workqueues "dlm_recv" and "dlm_send" are ordered workqeues. That's said
> and we having two workqueues for receive and send, they block each if
> both workqueues schedule the same connection at the same time because a
> per connection mutex to prevent that the socket gets released by being
> used.
>
> To make it more parallel we introduce one "dlm_io" workqueue which is
> not an ordered workqueue, the amount of workers are not limited. Due
> per connection flags SEND/RECV pending we schedule workers ordered per
> connection and per send and receive task. To get rid of the mutex
> blocking same workers to do socket handling we switched to a semaphore
> which handles socket operations as read lock and sock releases as write
> operations, to prevent sock_release() being called while the socket is
> being used.
>
> There might be more optimization removing the semaphore and replacing it
> with rcu, however due other circumstances e.g. othercon behaviour it
> seems complicated to doing this change. I added comments to remove the
> othercon handling and moving to rcu handling. We need to do that to the
> next dlm major version upgrade because it is not backwards compatible
> with the current connect mechanism.
>
> The processing of dlm messages need to be still handled by a ordered
> workqueue. An dlm_process ordered workqeue was introduced which gets
> filled by the receive worker. This is probably the next bottleneck of
> DLM but the application can't currently parse dlm messages parallel. A
> comment was introduced to lift the workqueue context of dlm processing
> in a non-sleepable softirq.
>
> The lifetime of a connection struct is now different because the
> dlm_node_addr structure was merged into the connection struct. The
> shutdown handling for TCP was removed to handle half-open sockets. We
> have a application handling for dealing with half-opened connection
> which is required by dlm and cluster manager join/leave events. SCTP
> doesn't support half-closed sockets and it's already handled by the
> application to never run into such case, therefore we removed it.
>
> To check if lowcomms is currently running and it cannot be configured at
> this time we introduced a function dlm_lowcomms_is_running() and remove
> the dlm_allow_conn variable. The synchronization of stopping all listen
> socket workers goes now of it's data ready socket callback.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/config.c    |    4 +-
>  fs/dlm/lockspace.c |    5 +-
>  fs/dlm/lowcomms.c  | 1453 ++++++++++++++++++++------------------------
>  fs/dlm/lowcomms.h  |    6 +-
>  fs/dlm/main.c      |    7 +-
>  fs/dlm/midcomms.c  |   68 ++-
>  fs/dlm/midcomms.h  |    4 +
>  7 files changed, 730 insertions(+), 817 deletions(-)
>
> diff --git a/fs/dlm/config.c b/fs/dlm/config.c
> index ac8b62106ce0..20b60709eccf 100644
> --- a/fs/dlm/config.c
> +++ b/fs/dlm/config.c
> @@ -183,7 +183,7 @@ static int dlm_check_protocol_and_dlm_running(unsigned int x)
>                 return -EINVAL;
>         }
>
> -       if (dlm_allow_conn)
...
> +
> +       switch (ret) {
> +       case DLM_IO_END:
> +               dlm_midcomms_receive_done(con->nodeid);
> +               break;
> +       case DLM_IO_EOF:
> +               close_connection(con, false);
> +               break;
> +       case DLM_IO_RESCHED:
> +               cond_resched();
> +               queue_work(io_workqueue, &con->rwork);
> +               break;
> +       default:
> +               if (ret < 0) {
> +                       log_print("node %d recv error %d", con->nodeid, ret);
> +                       close_connection(con, false);
> +                       dlm_midcomms_unack_msg_resend(con->nodeid);

I will change it to only call close_connection() on the send side and
put only a dlm_midcomms_unack_msg_resend() in here. It is difficult to
synchronize it with the sending worker. As we retransmit not acked dlm
messages we will hopefully get an error on the sending try and it will
close the socket.

Because the othercon and if we have the othercon it's only receiving
we will call close_connection() if it's a "othercon".

I currently try to run a test with tcpkill to see how the
close/reconnect behaviour acts.
I know the patch is really really big. I will try to split them
somehow into smaller ones as possible.

- Alex

