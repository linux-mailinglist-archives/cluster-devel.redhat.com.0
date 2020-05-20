Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A8E2E1DC29B
	for <lists+cluster-devel@lfdr.de>; Thu, 21 May 2020 01:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590015658;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=bxPhNLxEeIp1FyAEAyOXcpXoJGhcJI/9VkWQHjEBJu8=;
	b=ImJH1oCTVD5fyAIv6wdjK7QfZzFZeTVY2Rs10XOwPPqJ75LbzLXNVQokzCBRSzUg1lnvxK
	ekGO6jYoWGuw2vlOvz8vuMxWnDVrYPzVsmQtiYYW/+Zl6UuZbHNvRDJc9IeHlwS51gxF0C
	Z8Nsk4Ie1/lSeYRVpVsFolM6RdsoLtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Z4IJaI6YPGyiQ1PL62efDA-1; Wed, 20 May 2020 19:00:57 -0400
X-MC-Unique: Z4IJaI6YPGyiQ1PL62efDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EACF5800688;
	Wed, 20 May 2020 23:00:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 825545D9CA;
	Wed, 20 May 2020 23:00:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7C3D1809543;
	Wed, 20 May 2020 23:00:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KN0hPS009244 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 19:00:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01F472156A4A; Wed, 20 May 2020 23:00:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D42462156A2E
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 23:00:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C9B1800580
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 23:00:35 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-9-LKOjjE6eOCeAF_owkIHaQQ-1; Wed, 20 May 2020 19:00:30 -0400
X-MC-Unique: LKOjjE6eOCeAF_owkIHaQQ-1
Received: by mail-qk1-f195.google.com with SMTP id f83so5360584qke.13;
	Wed, 20 May 2020 16:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=bxPhNLxEeIp1FyAEAyOXcpXoJGhcJI/9VkWQHjEBJu8=;
	b=GPRlGQ4kZC0rUagZTxIhXYEhzL6ML2Y2PJI+oNU4Sns9gDBldSIlTc0bQtsrD/JnMw
	tOAZ4osHj/suZbQU8rkOfL3sTe9e+0F5emcZecKWbmNYcLYowLmEwDbY0sKPga0nzi7R
	QZFiY+AtuczGrPl2f3I0ChT8Fi6OnsJoKTeTRSKE1HugH3kcrfH/iWoi2qMVQZBjwNnl
	ISiuBL8vUhQ3nT4R+0VcJvwPUY8ZvDF1RgdupQZ8ZQxvRy58NXOwGUj1P9KKRCNJngy7
	SBGYt6zUJEqGt3YFO3PErlg1v7PWGT5dRYrSyAYL0vETaeUNuaBSc9vBnaTTV1FGLmy3
	4y/g==
X-Gm-Message-State: AOAM531vyryvQ0tGbnAC8/siEA+pKFJ2vrwd7XtjeMbRgGJ4iIYEPERL
	bqjzPlKEcfhIN8ACCMFhzg0=
X-Google-Smtp-Source: ABdhPJz4+N4OAMnIZUpFPrMKKpxZ5ipr9THKmBgVoh+NUJRSoyJQeFfxBAyAvgR9uTfieJGBqFR7qw==
X-Received: by 2002:a37:b244:: with SMTP id b65mr7801054qkf.329.1590015629321; 
	Wed, 20 May 2020 16:00:29 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.225])
	by smtp.gmail.com with ESMTPSA id
	n68sm3102877qkb.58.2020.05.20.16.00.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 May 2020 16:00:28 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 889A9C0DAC; Wed, 20 May 2020 20:00:25 -0300 (-03)
Date: Wed, 20 May 2020 20:00:25 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200520230025.GT2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-33-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200520195509.2215098-33-hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Subject: Re: [Cluster-devel] [PATCH 32/33] net: add a new bind_add method
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2020 at 09:55:08PM +0200, Christoph Hellwig wrote:
> The SCTP protocol allows to bind multiple address to a socket.  That
> feature is currently only exposed as a socket option.  Add a bind_add
> method struct proto that allows to bind additional addresses, and
> switch the dlm code to use the method instead of going through the
> socket option from kernel space.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/dlm/lowcomms.c  |  9 +++------
>  include/net/sock.h |  6 +++++-
>  net/core/sock.c    |  8 ++++++++
>  net/sctp/socket.c  | 23 +++++++++++++++++++++++
>  4 files changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index 9f1c3cdc9d653..3543a8fec9075 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -882,6 +882,7 @@ static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
>  static int sctp_bind_addrs(struct connection *con, uint16_t port)
>  {
>  	struct sockaddr_storage localaddr;
> +	struct sockaddr *addr = (struct sockaddr *)&localaddr;
>  	int i, addr_len, result = 0;
>  
>  	for (i = 0; i < dlm_local_count; i++) {
> @@ -889,13 +890,9 @@ static int sctp_bind_addrs(struct connection *con, uint16_t port)
>  		make_sockaddr(&localaddr, port, &addr_len);
>  
>  		if (!i)
> -			result = kernel_bind(con->sock,
> -					     (struct sockaddr *)&localaddr,
> -					     addr_len);
> +			result = kernel_bind(con->sock, addr, addr_len);
>  		else
> -			result = kernel_setsockopt(con->sock, SOL_SCTP,
> -						   SCTP_SOCKOPT_BINDX_ADD,
> -						   (char *)&localaddr, addr_len);
> +			result = sock_bind_add(con->sock->sk, addr, addr_len);
>  
>  		if (result < 0) {
>  			log_print("Can't bind to %d addr number %d, %d.\n",
> diff --git a/include/net/sock.h b/include/net/sock.h
> index d994daa418ec2..6e9f713a78607 100644
> --- a/include/net/sock.h
> +++ b/include/net/sock.h
> @@ -1156,7 +1156,9 @@ struct proto {
>  	int			(*sendpage)(struct sock *sk, struct page *page,
>  					int offset, size_t size, int flags);
>  	int			(*bind)(struct sock *sk,
> -					struct sockaddr *uaddr, int addr_len);
> +					struct sockaddr *addr, int addr_len);
> +	int			(*bind_add)(struct sock *sk,
> +					struct sockaddr *addr, int addr_len);
>  
>  	int			(*backlog_rcv) (struct sock *sk,
>  						struct sk_buff *skb);
> @@ -2698,4 +2700,6 @@ void sock_set_reuseaddr(struct sock *sk);
>  void sock_set_reuseport(struct sock *sk);
>  void sock_set_sndtimeo(struct sock *sk, s64 secs);
>  
> +int sock_bind_add(struct sock *sk, struct sockaddr *addr, int addr_len);
> +
>  #endif	/* _SOCK_H */
> diff --git a/net/core/sock.c b/net/core/sock.c
> index 2ca3425b519c0..61ec573221a60 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -3712,3 +3712,11 @@ bool sk_busy_loop_end(void *p, unsigned long start_time)
>  }
>  EXPORT_SYMBOL(sk_busy_loop_end);
>  #endif /* CONFIG_NET_RX_BUSY_POLL */
> +
> +int sock_bind_add(struct sock *sk, struct sockaddr *addr, int addr_len)
> +{
> +	if (!sk->sk_prot->bind_add)
> +		return -EOPNOTSUPP;
> +	return sk->sk_prot->bind_add(sk, addr, addr_len);
> +}
> +EXPORT_SYMBOL(sock_bind_add);
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index 827a9903ee288..8a0b9258f65c0 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -1057,6 +1057,27 @@ static int sctp_setsockopt_bindx(struct sock *sk,
>  	return err;
>  }
>  
> +static int sctp_bind_add(struct sock *sk, struct sockaddr *addr,
> +		int addrlen)
> +{
> +	struct sctp_af *af = sctp_get_af_specific(addr->sa_family);
> +	int err;
> +
> +	if (!af || af->sockaddr_len > addrlen)
> +		return -EINVAL;
> +	err = security_sctp_bind_connect(sk, SCTP_SOCKOPT_BINDX_ADD, addr,
> +			addrlen);

The security_ call above is done today within the sock lock.
I couldn't find any issue through a code review, though, so I'm fine
with leaving it as is. Just highlighting it..

> +	if (err)
> +		return err;
> +
> +	lock_sock(sk);
> +	err = sctp_do_bind(sk, (union sctp_addr *)addr, af->sockaddr_len);
> +	if (!err)
> +		err = sctp_send_asconf_add_ip(sk, addr, 1);

Some problems here.
- addr may contain a list of addresses
- the addresses, then, are not being validated
- sctp_do_bind may fail, on which it requires some undoing
  (like sctp_bindx_add does)
- code duplication with sctp_setsockopt_bindx.

This patch will conflict with David's one,
[PATCH net-next] sctp: Pull the user copies out of the individual sockopt functions.
(I'll finish reviewing it in the sequence)

AFAICT, this patch could reuse/build on his work in there. The goal is
pretty much the same and would avoid the issues above.

This patch could, then, point the new bind_add proto op to the updated
sctp_setsockopt_bindx almost directly.

Question then is: dlm never removes an addr from the bind list. Do we
want to add ops for both? Or one that handles both operations?
Anyhow, having the add operation but not the del seems very weird to
me.

> +	release_sock(sk);
> +	return err;
> +}
> +
>  static int sctp_connect_new_asoc(struct sctp_endpoint *ep,
>  				 const union sctp_addr *daddr,
>  				 const struct sctp_initmsg *init,
> @@ -9625,6 +9646,7 @@ struct proto sctp_prot = {
>  	.sendmsg     =	sctp_sendmsg,
>  	.recvmsg     =	sctp_recvmsg,
>  	.bind        =	sctp_bind,
> +	.bind_add    =  sctp_bind_add,
>  	.backlog_rcv =	sctp_backlog_rcv,
>  	.hash        =	sctp_hash,
>  	.unhash      =	sctp_unhash,
> @@ -9667,6 +9689,7 @@ struct proto sctpv6_prot = {
>  	.sendmsg	= sctp_sendmsg,
>  	.recvmsg	= sctp_recvmsg,
>  	.bind		= sctp_bind,
> +	.bind_add	= sctp_bind_add,
>  	.backlog_rcv	= sctp_backlog_rcv,
>  	.hash		= sctp_hash,
>  	.unhash		= sctp_unhash,
> -- 
> 2.26.2
> 

