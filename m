Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3475833CDB7
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Mar 2021 07:02:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-W1tSV2NZMJajPLW-auTmng-1; Tue, 16 Mar 2021 02:02:36 -0400
X-MC-Unique: W1tSV2NZMJajPLW-auTmng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABF27801817;
	Tue, 16 Mar 2021 06:02:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A8FB60C0F;
	Tue, 16 Mar 2021 06:02:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1F2E18155DE;
	Tue, 16 Mar 2021 06:02:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12G62U3j020471 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 02:02:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 992772166BA3; Tue, 16 Mar 2021 06:02:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93A052166BA2
	for <cluster-devel@redhat.com>; Tue, 16 Mar 2021 06:02:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BF69800B28
	for <cluster-devel@redhat.com>; Tue, 16 Mar 2021 06:02:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-140-F1ivMQbKPy2I5bTwEFcvlQ-1; Tue, 16 Mar 2021 02:02:23 -0400
X-MC-Unique: F1ivMQbKPy2I5bTwEFcvlQ-1
Received: from merlin.infradead.org ([2001:8b0:10b:1234::107])
	by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
	id 1lM2Lr-00HTCR-Q1; Tue, 16 Mar 2021 05:34:44 +0000
Received: from [2601:1c0:6280:3f0::9757]
	by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1lM2Li-001PXS-5h; Tue, 16 Mar 2021 05:34:34 +0000
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, ccaulfie@redhat.com,
	teigland@redhat.com, cluster-devel@redhat.com, linux-kernel@vger.kernel.org
References: <20210316052732.682020-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d5cc74f7-0534-8168-fcfb-dbcf1c940088@infradead.org>
Date: Mon, 15 Mar 2021 22:34:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316052732.682020-1-unixbhaskar@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: trivial@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] dlm: Mundane typo fixes throughout the
	file lock.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/15/21 10:27 PM, Bhaskar Chowdhury wrote:
> 
> Trivial typo fixes throughout the file.
> 
> cc: trivial@vger.kernel.org
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  fs/dlm/lock.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index 002123efc6b0..caadc426c8b4 100644
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
> @@ -1535,7 +1535,7 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
>  		return -1;
>  	}
> 
> -	/* Remove for the convert reply, and premptively remove for the
> +	/* Remove for the convert reply, and preemptively remove for the
>  	   cancel reply.  A convert has been granted while there's still
>  	   an outstanding cancel on it (the cancel is moot and the result
>  	   in the cancel reply should be 0).  We preempt the cancel reply
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
> --


-- 
~Randy

