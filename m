Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EF47F1D208F
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 23:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589403672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i+OP0NKpo8AmdUfakTtcQ/3ihHgmb7V+uh8OoMETnFM=;
	b=KZja9GhgxD+SgA46bzGQ64W3yBWqd2HAj13rynT5OX4vvzJgzBG4HqXsTxAMHAhXX22Xxo
	5uLBUPTTkFQELlVXBBHicFzy+f/PHCfH7+mDqAaUxjEm6F/YeDDAX1YRtPVukLpvbChGt/
	PYwo/CcWjatnVWfaQHMVYChHtk5wHoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-mcQQ8PorO_eERoBLPSaIUw-1; Wed, 13 May 2020 17:01:11 -0400
X-MC-Unique: mcQQ8PorO_eERoBLPSaIUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0F1107ACCA;
	Wed, 13 May 2020 21:01:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A089F10027AF;
	Wed, 13 May 2020 21:01:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90F854E982;
	Wed, 13 May 2020 21:01:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DL0vEY002639 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 17:00:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54BA22156A2D; Wed, 13 May 2020 21:00:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E8442166BA4
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 21:00:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D7341049840
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 21:00:54 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0158.hostedemail.com
	[216.40.44.158]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-316-r-OlUTZzMwaEGW2VILmbJQ-1; Wed, 13 May 2020 17:00:49 -0400
X-MC-Unique: r-OlUTZzMwaEGW2VILmbJQ-1
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay08.hostedemail.com (Postfix) with ESMTP id CA6F0182CED34;
	Wed, 13 May 2020 21:00:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:599:960:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2194:2196:2199:2200:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3871:3874:4250:4321:4385:5007:6742:6743:10004:10400:10848:11026:11232:11473:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:12986:13069:13311:13357:13439:14096:14097:14659:14721:21080:21627:21987:30012:30054:30059:30062:30091,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:2, LUA_SUMMARY:none
X-HE-Tag: mist41_5dde648048f06
X-Filterd-Recvd-Size: 3554
Received: from XPS-9350.home (unknown [47.151.136.130])
	(Authenticated sender: joe@perches.com)
	by omf01.hostedemail.com (Postfix) with ESMTPA;
	Wed, 13 May 2020 21:00:44 +0000 (UTC)
Message-ID: <0ee5acfaca4cf32d4efad162046b858981a4dae3.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 14:00:43 -0700
In-Reply-To: <20200513062649.2100053-21-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-21-hch@lst.de>
User-Agent: Evolution 3.36.1-2
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	linux-nvme@lists.infradead.org, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Vlad,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 20/33] ipv4: add ip_sock_set_recverr
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-13 at 08:26 +0200, Christoph Hellwig wrote:
> Add a helper to directly set the IP_RECVERR sockopt from kernel space
> without going through a fake uaccess.

This seems used only with true as the second arg.
Is there reason to have that argument at all?

> diff --git a/include/net/ip.h b/include/net/ip.h
[]
> @@ -767,5 +767,6 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
>  
>  void ip_sock_set_tos(struct sock *sk, int val);
>  void ip_sock_set_freebind(struct sock *sk, bool val);
> +void ip_sock_set_recverr(struct sock *sk, bool val);
>  
>  #endif	/* _IP_H */
> diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
> index 0c40887a817f8..9abecc3195520 100644
> --- a/net/ipv4/ip_sockglue.c
> +++ b/net/ipv4/ip_sockglue.c
> @@ -589,6 +589,16 @@ void ip_sock_set_freebind(struct sock *sk, bool val)
>  }
>  EXPORT_SYMBOL(ip_sock_set_freebind);
>  
> +void ip_sock_set_recverr(struct sock *sk, bool val)
> +{
> +	lock_sock(sk);
> +	inet_sk(sk)->recverr = val;
> +	if (!val)
> +		skb_queue_purge(&sk->sk_error_queue);
> +	release_sock(sk);
> +}
> +EXPORT_SYMBOL(ip_sock_set_recverr);
> +
>  /*
>   *	Socket option code for IP. This is the end of the line after any
>   *	TCP,UDP etc options on an IP socket.
> diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
> index 562ea36c96b0f..1b87b8a9ff725 100644
> --- a/net/rxrpc/local_object.c
> +++ b/net/rxrpc/local_object.c
> @@ -171,13 +171,7 @@ static int rxrpc_open_socket(struct rxrpc_local *local, struct net *net)
>  		/* Fall through */
>  	case AF_INET:
>  		/* we want to receive ICMP errors */
> -		opt = 1;
> -		ret = kernel_setsockopt(local->socket, SOL_IP, IP_RECVERR,
> -					(char *) &opt, sizeof(opt));
> -		if (ret < 0) {
> -			_debug("setsockopt failed");
> -			goto error;
> -		}
> +		ip_sock_set_recverr(local->socket->sk, true);
>  
>  		/* we want to set the don't fragment bit */
>  		opt = IP_PMTUDISC_DO;

