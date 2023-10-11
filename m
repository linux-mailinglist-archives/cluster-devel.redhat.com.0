Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 913257C4B46
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Oct 2023 09:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697008159;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8QD/BsjuTnHj+PwHqueV8pQ/mWjx4W6BeoqBtCx2gBQ=;
	b=BzyYIoLTJlCpdOqzFSfOXQc4dCkeiaMthfATytNRqDHd6LhixPTpBfpGVmxQinccrCKmbJ
	ndzEhmm5fuOT0UWipmdO922ip0Vuuxkn+rUqIKABlfiJhvk3+xwjkC/yIxhkd5T9rkIN2z
	meIfmJYYQVqrfnhC3S+WfRlO29CSgbg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-ZlDW7djaN0W4HrVmhEt1Fw-1; Wed, 11 Oct 2023 03:09:16 -0400
X-MC-Unique: ZlDW7djaN0W4HrVmhEt1Fw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65F173C108E0;
	Wed, 11 Oct 2023 07:09:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5751D63F55;
	Wed, 11 Oct 2023 07:09:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0ABA419466E8;
	Wed, 11 Oct 2023 07:09:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 92FB21946597 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 11 Oct 2023 06:33:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7FE3D2075278; Wed, 11 Oct 2023 06:33:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78F47207526F
 for <cluster-devel@redhat.com>; Wed, 11 Oct 2023 06:33:24 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AE43811E86
 for <cluster-devel@redhat.com>; Wed, 11 Oct 2023 06:33:24 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-132-1gpg2atINouv_ev5hYRYWQ-1; Wed,
 11 Oct 2023 02:33:22 -0400
X-MC-Unique: 1gpg2atINouv_ev5hYRYWQ-1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 262EEB81F69;
 Wed, 11 Oct 2023 06:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E34AC433C7;
 Wed, 11 Oct 2023 06:25:35 +0000 (UTC)
Date: Wed, 11 Oct 2023 08:25:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <2023101129-stabilize-tree-5959@gregkh>
References: <20231010220448.2978176-1-aahringo@redhat.com>
 <20231010220448.2978176-8-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231010220448.2978176-8-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH RESEND 8/8] dlm: slow down filling up
 processing queue
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev,
 christophe.jaillet@wanadoo.fr, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 10, 2023 at 06:04:48PM -0400, Alexander Aring wrote:
> If there is a burst of message the receive worker will filling up the
> processing queue but where are too slow to process dlm messages. This
> patch will slow down the receiver worker to keep the buffer on the
> socket layer to tell the sender to backoff. This is done by a threshold
> to get the next buffers from the socket after all messages were
> processed done by a flush_workqueue(). This however only occurs when we
> have a message burst when we e.g. create 1 million locks. If we put more
> and more new messages to process in the processqueue we will soon run out
> of memory.
> 
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/lowcomms.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index f7bc22e74db2..67f8dd8a05ef 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -63,6 +63,7 @@
>  #include "config.h"
>  
>  #define DLM_SHUTDOWN_WAIT_TIMEOUT msecs_to_jiffies(5000)
> +#define DLM_MAX_PROCESS_BUFFERS 24
>  #define NEEDED_RMEM (4*1024*1024)
>  
>  struct connection {
> @@ -194,6 +195,7 @@ static const struct dlm_proto_ops *dlm_proto_ops;
>  #define DLM_IO_END 1
>  #define DLM_IO_EOF 2
>  #define DLM_IO_RESCHED 3
> +#define DLM_IO_FLUSH 4
>  
>  static void process_recv_sockets(struct work_struct *work);
>  static void process_send_sockets(struct work_struct *work);
> @@ -202,6 +204,7 @@ static void process_dlm_messages(struct work_struct *work);
>  static DECLARE_WORK(process_work, process_dlm_messages);
>  static DEFINE_SPINLOCK(processqueue_lock);
>  static bool process_dlm_messages_pending;
> +static atomic_t processqueue_count;
>  static LIST_HEAD(processqueue);
>  
>  bool dlm_lowcomms_is_running(void)
> @@ -874,6 +877,7 @@ static void process_dlm_messages(struct work_struct *work)
>  	}
>  
>  	list_del(&pentry->list);
> +	atomic_dec(&processqueue_count);
>  	spin_unlock(&processqueue_lock);
>  
>  	for (;;) {
> @@ -891,6 +895,7 @@ static void process_dlm_messages(struct work_struct *work)
>  		}
>  
>  		list_del(&pentry->list);
> +		atomic_dec(&processqueue_count);
>  		spin_unlock(&processqueue_lock);
>  	}
>  }
> @@ -962,6 +967,7 @@ static int receive_from_sock(struct connection *con, int buflen)
>  		con->rx_leftover);
>  
>  	spin_lock(&processqueue_lock);
> +	ret = atomic_inc_return(&processqueue_count);
>  	list_add_tail(&pentry->list, &processqueue);
>  	if (!process_dlm_messages_pending) {
>  		process_dlm_messages_pending = true;
> @@ -969,6 +975,9 @@ static int receive_from_sock(struct connection *con, int buflen)
>  	}
>  	spin_unlock(&processqueue_lock);
>  
> +	if (ret > DLM_MAX_PROCESS_BUFFERS)
> +		return DLM_IO_FLUSH;
> +
>  	return DLM_IO_SUCCESS;
>  }
>  
> @@ -1503,6 +1512,9 @@ static void process_recv_sockets(struct work_struct *work)
>  		wake_up(&con->shutdown_wait);
>  		/* CF_RECV_PENDING cleared */
>  		break;
> +	case DLM_IO_FLUSH:
> +		flush_workqueue(process_workqueue);
> +		fallthrough;
>  	case DLM_IO_RESCHED:
>  		cond_resched();
>  		queue_work(io_workqueue, &con->rwork);
> -- 
> 2.39.3
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

