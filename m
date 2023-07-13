Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4249875257F
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 16:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689259794;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UZ5RNgYPZYN9vDQ4roRPvHQiLk60kFCqxs8e/jvXzi4=;
	b=RlKhxZrmUDHA7sm7xoCGNv68dMAWC//mFM3BVPQsGs41nGJeqBrjqcdDlLnXRVHpEe8mCl
	gzEOrm0dJGqNspvx6YfPyBYG3wZDpCa1sV6HSP/pgRRE92fidxH9HVPTNnXG3YBPmdxQzg
	d9a31SaiXykANcQecVQckWeupWg++yI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-EM8at7AmPlCLaHs1hzJIKw-1; Thu, 13 Jul 2023 10:49:49 -0400
X-MC-Unique: EM8at7AmPlCLaHs1hzJIKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3565E101CAA4;
	Thu, 13 Jul 2023 14:49:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 187B8C1ED96;
	Thu, 13 Jul 2023 14:49:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BC2F019465A0;
	Thu, 13 Jul 2023 14:49:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E84DF1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 14:49:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 908C6C1ED97; Thu, 13 Jul 2023 14:49:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89278C1ED96
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 14:49:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6933E280016C
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 14:49:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-SfkPJcZuMAKGE_LoAelmcA-1; Thu, 13 Jul 2023 10:49:31 -0400
X-MC-Unique: SfkPJcZuMAKGE_LoAelmcA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 218EF612FC;
 Thu, 13 Jul 2023 14:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF51C433C7;
 Thu, 13 Jul 2023 14:49:28 +0000 (UTC)
Date: Thu, 13 Jul 2023 16:49:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <2023071318-traffic-impeding-dc64@gregkh>
References: <20230713144029.3342637-1-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230713144029.3342637-1-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v6.5-rc1 1/2] fs: dlm: introduce
 DLM_PLOCK_FL_NO_REPLY flag
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 13, 2023 at 10:40:28AM -0400, Alexander Aring wrote:
> This patch introduces a new flag DLM_PLOCK_FL_NO_REPLY in case an dlm
> plock operation should not send a reply back. Currently this is kind of
> being handled in DLM_PLOCK_FL_CLOSE, but DLM_PLOCK_FL_CLOSE has more
> meanings that it will remove all waiters for a specific nodeid/owner
> values in by doing a unlock operation. In case of an error in dlm user
> space software e.g. dlm_controld we get an reply with an error back.
> This cannot be matched because there is no op to match in recv_list. We
> filter now on DLM_PLOCK_FL_NO_REPLY in case we had an error back as
> reply. In newer dlm_controld version it will never send a result back
> when DLM_PLOCK_FL_NO_REPLY is set. This filter is a workaround to handle
> older dlm_controld versions.
> 
> Fixes: 901025d2f319 ("dlm: make plock operation killable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Aring <aahringo@redhat.com>

Why is adding a new uapi a stable patch?

> ---
>  fs/dlm/plock.c                 | 23 +++++++++++++++++++----
>  include/uapi/linux/dlm_plock.h |  1 +
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index 70a4752ed913..7fe9f4b922d3 100644
> --- a/fs/dlm/plock.c
> +++ b/fs/dlm/plock.c
> @@ -96,7 +96,7 @@ static void do_unlock_close(const struct dlm_plock_info *info)
>  	op->info.end		= OFFSET_MAX;
>  	op->info.owner		= info->owner;
>  
> -	op->info.flags |= DLM_PLOCK_FL_CLOSE;
> +	op->info.flags |= (DLM_PLOCK_FL_CLOSE | DLM_PLOCK_FL_NO_REPLY);
>  	send_op(op);
>  }
>  
> @@ -293,7 +293,7 @@ int dlm_posix_unlock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
>  		op->info.owner	= (__u64)(long) fl->fl_owner;
>  
>  	if (fl->fl_flags & FL_CLOSE) {
> -		op->info.flags |= DLM_PLOCK_FL_CLOSE;
> +		op->info.flags |= (DLM_PLOCK_FL_CLOSE | DLM_PLOCK_FL_NO_REPLY);
>  		send_op(op);
>  		rv = 0;
>  		goto out;
> @@ -392,7 +392,7 @@ static ssize_t dev_read(struct file *file, char __user *u, size_t count,
>  	spin_lock(&ops_lock);
>  	if (!list_empty(&send_list)) {
>  		op = list_first_entry(&send_list, struct plock_op, list);
> -		if (op->info.flags & DLM_PLOCK_FL_CLOSE)
> +		if (op->info.flags & DLM_PLOCK_FL_NO_REPLY)
>  			list_del(&op->list);
>  		else
>  			list_move_tail(&op->list, &recv_list);
> @@ -407,7 +407,7 @@ static ssize_t dev_read(struct file *file, char __user *u, size_t count,
>  	   that were generated by the vfs cleaning up for a close
>  	   (the process did not make an unlock call). */
>  
> -	if (op->info.flags & DLM_PLOCK_FL_CLOSE)
> +	if (op->info.flags & DLM_PLOCK_FL_NO_REPLY)
>  		dlm_release_plock_op(op);
>  
>  	if (copy_to_user(u, &info, sizeof(info)))
> @@ -433,6 +433,21 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
>  	if (check_version(&info))
>  		return -EINVAL;
>  
> +	/* Some old dlm user space software will send replies back,
> +	 * even if DLM_PLOCK_FL_NO_REPLY is set (because the flag is
> +	 * new) e.g. if a error occur. We can't match them in recv_list
> +	 * because they were never be part of it. We filter it here,
> +	 * new dlm user space software will filter it in user space.
> +	 *
> +	 * In future this handling can be removed.
> +	 */
> +	if (info.flags & DLM_PLOCK_FL_NO_REPLY) {
> +		pr_info("Received unexpected reply from op %d, "
> +			"please update DLM user space software!\n",
> +			info.optype);

Never allow userspace to spam the kernel log.  And this is not going to
work, you need to handle the error and at most, report this to userspace
once.

Also, don't wrap your strings, checkpatch should have told you this.

thanks,

greg k-h

