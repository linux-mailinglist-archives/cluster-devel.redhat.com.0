Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09D3E32703B
	for <lists+cluster-devel@lfdr.de>; Sun, 28 Feb 2021 05:13:31 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-FMNctQrzPtWprVQTkJPyCg-1; Sat, 27 Feb 2021 23:13:29 -0500
X-MC-Unique: FMNctQrzPtWprVQTkJPyCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9825218B6145;
	Sun, 28 Feb 2021 04:13:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 484C767CE4;
	Sun, 28 Feb 2021 04:13:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 566244E58D;
	Sun, 28 Feb 2021 04:13:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11S4DDrJ021082 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 27 Feb 2021 23:13:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F00214E3DB; Sun, 28 Feb 2021 04:13:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA4BC9D474
	for <cluster-devel@redhat.com>; Sun, 28 Feb 2021 04:13:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 867731022F09
	for <cluster-devel@redhat.com>; Sun, 28 Feb 2021 04:13:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-249-3i0ZF1zgOsuJcbfsVae4vQ-1; Sat, 27 Feb 2021 23:13:06 -0500
X-MC-Unique: 3i0ZF1zgOsuJcbfsVae4vQ-1
Received: from [2601:1c0:6280:3f0::3ba4]
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lG9k3-00066Y-9b; Sun, 28 Feb 2021 00:15:23 +0000
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, ccaulfie@redhat.com,
	teigland@redhat.com, cluster-devel@redhat.com, linux-kernel@vger.kernel.org
References: <20210227233336.6290-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <51c331a2-59e0-c485-f3b0-d582963c87da@infradead.org>
Date: Sat, 27 Feb 2021 16:15:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210227233336.6290-1-unixbhaskar@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] fs: dlm: Spellings fixed throughout the
	fle lock.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/27/21 3:33 PM, Bhaskar Chowdhury wrote:
> 
> Few spelling fixes throughout the file.
> 

in Subject: s/fle/file/

> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  fs/dlm/lock.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index 002123efc6b0..efcd84faca14 100644
> --- a/fs/dlm/lock.c
> +++ b/fs/dlm/lock.c
> @@ -91,7 +91,7 @@ static void del_timeout(struct dlm_lkb *lkb);
>  static void toss_rsb(struct kref *kref);
> 
>  /*
> - * Lock compatibilty matrix - thanks Steve
> + * Lock compatibility matrix - thanks Steve
>   * UN = Unlocked state. Not really a state, used as a flag
>   * PD = Padding. Used to make the matrix a nice power of two in size
>   * Other states are the same as the VMS DLM.
> @@ -594,7 +594,7 @@ static int find_rsb_dir(struct dlm_ls *ls, char *name, int len,
>  	error = dlm_search_rsb_tree(&ls->ls_rsbtbl[b].keep, name, len, &r);
>  	if (error)
>  		goto do_toss;
> -
> +

stray change?

>  	/*
>  	 * rsb is active, so we can't check master_nodeid without lock_rsb.
>  	 */
> @@ -2357,14 +2357,14 @@ static int _can_be_granted(struct dlm_rsb *r, struct dlm_lkb *lkb, int now,
>  	 * 6-5: But the default algorithm for deciding whether to grant or
>  	 * queue conversion requests does not by itself guarantee that such
>  	 * requests are serviced on a "first come first serve" basis.  This, in
> -	 * turn, can lead to a phenomenon known as "indefinate postponement".
> +	 * turn, can lead to a phenomenon known as "indefinite postponement".
>  	 *
>  	 * 6-7: This issue is dealt with by using the optional QUECVT flag with
>  	 * the system service employed to request a lock conversion.  This flag
>  	 * forces certain conversion requests to be queued, even if they are
>  	 * compatible with the granted modes of other locks on the same
>  	 * resource.  Thus, the use of this flag results in conversion requests
> -	 * being ordered on a "first come first servce" basis.
> +	 * being ordered on a "first come first serve" basis.
>  	 *
>  	 * DCT: This condition is all about new conversions being able to occur
>  	 * "in place" while the lock remains on the granted queue (assuming
> @@ -5745,7 +5745,7 @@ int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc)
> 
>  		log_debug(ls, "dlm_recover_process_copy %x remote %d %x %d",
>  			  lkid, rc->rc_header.h_nodeid, remid, result);
> -
> +

stray change?

>  		dlm_send_rcom_lock(r, lkb);
>  		goto out;
>  	case -EEXIST:
> --


-- 
~Randy

