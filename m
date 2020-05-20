Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 022F21DC2B1
	for <lists+cluster-devel@lfdr.de>; Thu, 21 May 2020 01:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590016219;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=/qygMQEHgAHnXXlcBf3bWz8hekZtO5JE6hUpY/E6MlI=;
	b=DPu9yym565AYrokuPW3q7gYI2vqp1XstARxeYZlR2lMGKZW+Vzpp4vohIPsqCKtdQDr71l
	NSSqA0OJ8vk37X8zmUjYHAewyEiTz7GyODkNxPPebFssBoUyksbHwdF+/hs9cBYW+F3uiN
	M+0cyGU06dseL5dDPt4g7Ruai4ZNkrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-AT3UZFD8OTWecRWNEOQdjA-1; Wed, 20 May 2020 19:10:17 -0400
X-MC-Unique: AT3UZFD8OTWecRWNEOQdjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CA6D80B71E;
	Wed, 20 May 2020 23:10:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CDC848D7E;
	Wed, 20 May 2020 23:10:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B45F1809543;
	Wed, 20 May 2020 23:10:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KNABj5009647 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 19:10:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFC78202696C; Wed, 20 May 2020 23:10:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC02B2026D69
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 23:10:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC9C5811E77
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 23:10:08 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-19-3XTUT1R9MLK1x1SHm6IgaQ-1; Wed, 20 May 2020 19:10:04 -0400
X-MC-Unique: 3XTUT1R9MLK1x1SHm6IgaQ-1
Received: by mail-qt1-f196.google.com with SMTP id i68so4070874qtb.5;
	Wed, 20 May 2020 16:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=/qygMQEHgAHnXXlcBf3bWz8hekZtO5JE6hUpY/E6MlI=;
	b=WVhLgSAj3E0ZSEbVWK6ZZMN/7n3pTK+mDTSfNLoLDYlQAPK99+Lbbl6TrN1Fe6u8yo
	6A/Rhw2pr1+AFbTaUG3o4YGb3ttzlAEMf9S4nLhQGNjt5446FOH6nmvoASsP4TJZtebn
	V/GykXxFytR/cb9l2lO8CVUQYaGoilqRHr29iBqYSe0BYsCCyxAjoH3Y3wxilMzIHSPy
	wxbqZp5Hl7RGUQbhRayu2mYIxno6mjd1+y9ctu16Lf3VcZqSV6lOG8lzour76dz2XCGp
	i7QtI7+FudVjHmJ4v+WsQhB6T+b5RXbe2o//ya7zpvL3kbpC2OQFBXaJsxvh5UGr6Spe
	s7qg==
X-Gm-Message-State: AOAM531GlePY2cqSaw5wddlWKzFTvRj+R0WdJtxLyWqWk7pdRxCS+bvi
	wBH7CNuZzJRyI5LkhbnQ6eA=
X-Google-Smtp-Source: ABdhPJwRWSgggkzxnJn0dwyU2QDiQnm5wTM+hCXxxx8a5qFL0yi0c7Z5VunfQVgq58oD4bmA7XAdrQ==
X-Received: by 2002:aed:3f7b:: with SMTP id q56mr7818149qtf.152.1590016204171; 
	Wed, 20 May 2020 16:10:04 -0700 (PDT)
Received: from localhost.localdomain
	([2001:1284:f013:b7f5:289f:a703:e466:2a27])
	by smtp.gmail.com with ESMTPSA id
	e28sm3451287qkn.17.2020.05.20.16.10.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 May 2020 16:10:03 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 2EE17C0DAC; Wed, 20 May 2020 20:10:01 -0300 (-03)
Date: Wed, 20 May 2020 20:10:01 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200520231001.GU2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-32-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200520195509.2215098-32-hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	Jakub Kicinski <kuba@kernel.org>, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 31/33] sctp: add sctp_sock_set_nodelay
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2020 at 09:55:07PM +0200, Christoph Hellwig wrote:
> Add a helper to directly set the SCTP_NODELAY sockopt from kernel space
> without going through a fake uaccess.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
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

The duplication with sctp_setsockopt_nodelay() is quite silly/bad.
Also, why have the 'true' hardcoded? It's what dlm uses, yes, but the
API could be a bit more complete than that.

Like for the other patch, this one could build on David's patch, do
the ternary check before calling sctp_setsockopt_nodelay and then move
sctp_setsockopt_nodelay to the header, or something like that.

