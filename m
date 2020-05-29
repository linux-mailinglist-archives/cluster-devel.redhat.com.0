Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4545B1E830F
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 18:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590768332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=W/5acxUy0tPXC4WQ+gK2CfotTHafKGLmUlvwhNajW8E=;
	b=XMM0QH7r/JVVTMH8RTN5ytNoxyKI41VzFsgm3drvQxf9+k1KQdX31hyNDKFoQHNe7MXCuB
	GrTfrYfII2DatjLEyiZ4C+isn8XvZVIKHrHzJFcgqD1zeFM3I6YPY4i/+aLBGsNaKrWe7T
	LdaRlPORKOzI0OZR4HsMx7fV94Ta1qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-9YSvx_xDOdm6jh_LHYoAXA-1; Fri, 29 May 2020 12:05:30 -0400
X-MC-Unique: 9YSvx_xDOdm6jh_LHYoAXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6FF08018A4;
	Fri, 29 May 2020 16:05:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA0525C1B5;
	Fri, 29 May 2020 16:05:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E08A41809543;
	Fri, 29 May 2020 16:05:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TG5Npp025843 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 12:05:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 161C7B0782; Fri, 29 May 2020 16:05:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FEE6F5AC6
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 16:05:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 522AC801036
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 16:05:20 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-210-cM3_UdrvP-CVBvHWWCdrtQ-1; Fri, 29 May 2020 12:05:18 -0400
X-MC-Unique: cM3_UdrvP-CVBvHWWCdrtQ-1
Received: by mail-qk1-f193.google.com with SMTP id 205so2669743qkg.3
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 09:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=W/5acxUy0tPXC4WQ+gK2CfotTHafKGLmUlvwhNajW8E=;
	b=WT2bVMQyVZwDZCQOb9KGAwZCgLANZXXH/oErlB7vJa55zq5afqgw9uFXk2V3ITxotU
	mKIe41FMgiJ+F9JLw1XzEvg89WwGgZjkuqmsYrET8B4++duKcXT4sl/u8ixY6JMoFCq8
	p0vyRn894ojj6rWydiyjnBb3r5MFvsSdqLepiQRBILF51/YwGXcTshJVQ5Daw35fVwsm
	NoLC9wGzC/Cm/MUepqOWsmX1+PJaBIHcKZ2DAsqzjj43UiWBCjHeC6pHLjPF3CKkyrt2
	13khXKxUDwSOrR8Yh/Y0vr55QN0kSc48HU+pTGH8Fr3OpHsqHAqFznyaApNhOcmeDnPn
	aeng==
X-Gm-Message-State: AOAM531A22uFPs4LlfnsNo1RYUUaRSyBkNOcQhxDsBwD1S96iY2H5ib7
	++q4a9LyzirA+S7VvD8OOXQ=
X-Google-Smtp-Source: ABdhPJzdt/kXXfrBEfw95zber/esL31JmnLdUMJ2Vt2cDTVx9+/hBSM8jSEdo9tYgm9y29NG5QXSTw==
X-Received: by 2002:ae9:f40b:: with SMTP id y11mr8491950qkl.107.1590768317293; 
	Fri, 29 May 2020 09:05:17 -0700 (PDT)
Received: from localhost.localdomain
	([2001:1284:f013:516d:2604:bfa5:7157:afa1])
	by smtp.gmail.com with ESMTPSA id i94sm8009525qtd.2.2020.05.29.09.05.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 May 2020 09:05:16 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 33AE8C1B84; Fri, 29 May 2020 13:05:14 -0300 (-03)
Date: Fri, 29 May 2020 13:05:14 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200529160514.GH2491@localhost.localdomain>
References: <20200529120943.101454-1-hch@lst.de>
	<20200529120943.101454-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200529120943.101454-2-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, netdev@vger.kernel.org,
	Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	linux-sctp@vger.kernel.org, David Laight <David.Laight@aculab.com>,
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Cluster-devel] [PATCH 1/4] sctp: add sctp_sock_set_nodelay
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 02:09:40PM +0200, Christoph Hellwig wrote:
> Add a helper to directly set the SCTP_NODELAY sockopt from kernel space
> without going through a fake uaccess.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>

I'm taking the action item to make sctp_setsockopt_nodelay() use the
new helper. Will likely create a __ variant of it, due to sock lock.

> ---
>  fs/dlm/lowcomms.c       | 10 ++--------
>  include/net/sctp/sctp.h |  7 +++++++
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index 69333728d871b..9f1c3cdc9d653 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -914,7 +914,6 @@ static int sctp_bind_addrs(struct connection *con, uint16_t port)
>  static void sctp_connect_to_sock(struct connection *con)
>  {
>  	struct sockaddr_storage daddr;
> -	int one = 1;
>  	int result;
>  	int addr_len;
>  	struct socket *sock;
> @@ -961,8 +960,7 @@ static void sctp_connect_to_sock(struct connection *con)
>  	log_print("connecting to %d", con->nodeid);
>  
>  	/* Turn off Nagle's algorithm */
> -	kernel_setsockopt(sock, SOL_SCTP, SCTP_NODELAY, (char *)&one,
> -			  sizeof(one));
> +	sctp_sock_set_nodelay(sock->sk);
>  
>  	/*
>  	 * Make sock->ops->connect() function return in specified time,
> @@ -1176,7 +1174,6 @@ static int sctp_listen_for_all(void)
>  	struct socket *sock = NULL;
>  	int result = -EINVAL;
>  	struct connection *con = nodeid2con(0, GFP_NOFS);
> -	int one = 1;
>  
>  	if (!con)
>  		return -ENOMEM;
> @@ -1191,10 +1188,7 @@ static int sctp_listen_for_all(void)
>  	}
>  
>  	sock_set_rcvbuf(sock->sk, NEEDED_RMEM);
> -	result = kernel_setsockopt(sock, SOL_SCTP, SCTP_NODELAY, (char *)&one,
> -				   sizeof(one));
> -	if (result < 0)
> -		log_print("Could not set SCTP NODELAY error %d\n", result);
> +	sctp_sock_set_nodelay(sock->sk);
>  
>  	write_lock_bh(&sock->sk->sk_callback_lock);
>  	/* Init con struct */
> diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
> index 3ab5c6bbb90bd..f8bcb75bb0448 100644
> --- a/include/net/sctp/sctp.h
> +++ b/include/net/sctp/sctp.h
> @@ -615,4 +615,11 @@ static inline bool sctp_newsk_ready(const struct sock *sk)
>  	return sock_flag(sk, SOCK_DEAD) || sk->sk_socket;
>  }
>  
> +static inline void sctp_sock_set_nodelay(struct sock *sk)
> +{
> +	lock_sock(sk);
> +	sctp_sk(sk)->nodelay = true;
> +	release_sock(sk);
> +}
> +
>  #endif /* __net_sctp_h__ */
> -- 
> 2.26.2
> 

