Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 97C2B32700A
	for <lists+cluster-devel@lfdr.de>; Sun, 28 Feb 2021 03:07:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-AvUqq66qOQ-T3cs3Zr0Xow-1; Sat, 27 Feb 2021 21:07:53 -0500
X-MC-Unique: AvUqq66qOQ-T3cs3Zr0Xow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8768918B6141;
	Sun, 28 Feb 2021 02:07:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8682D5947F;
	Sun, 28 Feb 2021 02:07:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D84C74E58E;
	Sun, 28 Feb 2021 02:07:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11S27ZO5007945 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 27 Feb 2021 21:07:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 90CFE6B42E; Sun, 28 Feb 2021 02:07:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B7AC9D47E
	for <cluster-devel@redhat.com>; Sun, 28 Feb 2021 02:07:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 282C6100AFE0
	for <cluster-devel@redhat.com>; Sun, 28 Feb 2021 02:07:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-594-WR1UlAV0OOO6ZLp-agA1QA-1; Sat, 27 Feb 2021 21:07:28 -0500
X-MC-Unique: WR1UlAV0OOO6ZLp-agA1QA-1
Received: from [2601:1c0:6280:3f0::3ba4]
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGBUU-000170-UB; Sun, 28 Feb 2021 02:07:27 +0000
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, ccaulfie@redhat.com,
	teigland@redhat.com, cluster-devel@redhat.com, linux-kernel@vger.kernel.org
References: <20210228010205.28697-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d5205f03-9080-0b46-e9eb-044f7bc42748@infradead.org>
Date: Sat, 27 Feb 2021 18:07:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210228010205.28697-1-unixbhaskar@gmail.com>
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
Subject: Re: [Cluster-devel] [PATCH V2] fs: dlm: Spellings fixed throughout
	the file lock.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/27/21 5:02 PM, Bhaskar Chowdhury wrote:
> 
> Few spelling fixes throughout the file.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Changes from V1:
>  Fixed the subject line typo.
>  Measured unwanted blank lines insertion.
> 
>  fs/dlm/lock.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index 002123efc6b0..b00001c36ed5 100644
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

