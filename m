Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5281F3D75
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jun 2020 16:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591711260;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M4IaWfK0UirgJkwMl2ybGMFZuZmbaReRQmeuETfjWr0=;
	b=c6vZk1AsGK4U6K05QdfjvUk1VFqSSozjN7AkOMWW6Na8o1GQpwVSIWvQ7mcaUY8y49XYrS
	nL3VSD2UoqjxXqdlEMvEcnAWP4/6LqLgTa31B2eOsywUCzhU1K66Hm6FRbTa7pU5xScy4M
	uz/WUTq6M33xM5NdlFxfifWyC6KVNtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-fw2k3D6LOuKltfqhOgGx7A-1; Tue, 09 Jun 2020 10:00:58 -0400
X-MC-Unique: fw2k3D6LOuKltfqhOgGx7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5453801504;
	Tue,  9 Jun 2020 14:00:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C56F8202B;
	Tue,  9 Jun 2020 14:00:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1EDF180954D;
	Tue,  9 Jun 2020 14:00:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059E0p7o006243 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 10:00:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 082E9891E0; Tue,  9 Jun 2020 14:00:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 897E6891CE
	for <cluster-devel@redhat.com>; Tue,  9 Jun 2020 14:00:47 +0000 (UTC)
To: cluster-devel@redhat.com
References: <181861383.32913711.1591710911880.JavaMail.zimbra@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <d9b2cb1b-c190-4945-ff3a-b6fd1fd61803@redhat.com>
Date: Tue, 9 Jun 2020 15:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <181861383.32913711.1591710911880.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: fix trans slab error when
 withdraw occurs inside log_flush
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/06/2020 14:55, Bob Peterson wrote:
> Hi,
>
> Log flush operations (gfs2_log_flush()) can target a specific transaction.
> But if the function encounters errors (e.g. io errors) and withdraws,
> the transaction was only freed it if was queued to one of the ail lists.
> If the withdraw occurred before the transaction was queued to the ail1
> list, function ail_drain never freed it. The result was:
>
> BUG gfs2_trans: Objects remaining in gfs2_trans on __kmem_cache_shutdown()
>
> This patch makes log_flush() add the targeted transaction to the ail1
> list so that function ail_drain() will find and free it properly.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>   fs/gfs2/log.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index 3e4734431783..2b05415bbc13 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -1002,6 +1002,16 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
>   
>   out:
>   	if (gfs2_withdrawn(sdp)) {
> +		/**
> +		 * If the tr_list is empty, we're withdrawing during a log
> +		 * flush that targets a transaction, but the transaction was
> +		 * never queued onto any of the ail lists. Here we add it to
> +		 * ail1 just so that ail_drain() will find and free it.
> +		 */
> +		spin_lock(&sdp->sd_ail_lock);
> +		if (tr && list_empty(&tr->tr_list))
> +			list_add(&tr->tr_list, &sdp->sd_ail1_list);
> +		spin_unlock(&sdp->sd_ail_lock);
>   		ail_drain(sdp); /* frees all transactions */
>   		tr = NULL;
>   	}
>
I'm not sure quite what the aim is here... are you sure that it is ok to 
move something to the AIL list if there has been a withdrawal? If the 
log flush has not completed correctly then we should not be moving 
anything to the AIL lists I think,

Steve.


