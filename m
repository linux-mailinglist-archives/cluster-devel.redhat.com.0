Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DCA6C2F6094
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Jan 2021 12:56:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610625413;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bJ5xcat95ssrG1x6tRKejfJy649A01Ubd0j3ombq4zM=;
	b=Zl5t2fM3aB4Lckzdkv4tqCAVybXcz//5WugFFAYYzgjk0RS0A6DyDvl6YB8eh235DgnfhS
	61iJiTSu039I4qK9j0gO11qihM815t7h0GVvDEwik2gMdVS2YGuEimXymD/HyLeij8aCQv
	YWEhhJ0B14ep39BlpzqrNhyuI0fbdGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-3JWpWsitMP-hJsXv9CzaiA-1; Thu, 14 Jan 2021 06:56:51 -0500
X-MC-Unique: 3JWpWsitMP-hJsXv9CzaiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B96FB15726;
	Thu, 14 Jan 2021 11:56:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 791585D9DD;
	Thu, 14 Jan 2021 11:56:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0616F180954D;
	Thu, 14 Jan 2021 11:56:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10EBueIr007290 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 06:56:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E82319C78; Thu, 14 Jan 2021 11:56:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.37.29] (unknown [10.33.37.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2585F19C71;
	Thu, 14 Jan 2021 11:56:35 +0000 (UTC)
To: Alexander Aring <aahringo@redhat.com>, cluster-devel@redhat.com
References: <20210113173646.43173-1-aahringo@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <51fe8a57-60af-e581-3eab-2380bfdbee87@redhat.com>
Date: Thu, 14 Jan 2021 11:56:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113173646.43173-1-aahringo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH gfs2-utils] mkfs.gfs2: make are you sure
	EOF happy
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13/01/2021 17:36, Alexander Aring wrote:
> This patch adds a check for getline() error, as the manpage states out
> that -1 is returned in EOF case we answer such case and possible
> other errors with no. If you currently press ctrl-d during this question
> an endless loop of asking this question over and over again will occur.
> However this patch changes to handle errors with no and prints a newline
> so the user have a new clean shell prompt afterwards. If getline reads
> zero characters .e.g '\n', the question is if we are sure is asked again.
> 
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>   gfs2/mkfs/main_mkfs.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Applied, thanks Alex.

Andy

> 
> diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
> index 5e34ca1f..e6fc6532 100644
> --- a/gfs2/mkfs/main_mkfs.c
> +++ b/gfs2/mkfs/main_mkfs.c
> @@ -528,9 +528,14 @@ static int are_you_sure(void)
>   		   `locale -k noexpr` */
>   		printf( _("Are you sure you want to proceed? [y/n] "));
>   		ret = getline(&line, &len, stdin);
> +		if (ret < 0) {
> +			printf("\n");
> +			free(line);
> +			return 0;
> +		}
>   		res = rpmatch(line);
>   		free(line);
> -		if (ret <= 0)
> +		if (ret == 0)
>   			continue;
>   		if (res == 1) /* Yes */
>   			return 1;
> 

