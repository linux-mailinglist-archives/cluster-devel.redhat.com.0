Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E68A51E835D
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 18:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590768930;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=y+4rgbyVFdpWdnFfPGEMNo5bmNIxGC5yE0lzC9sLPDI=;
	b=UV9vp4jXWPHwy/mZBvBfQ/kQ9XLia/1SKJXbk8f5Is3w1i1GxzDvoJG9JiKWsyWiCM0vC3
	OTRBylgxRSUqZGk8in+MWAP8AN9Io24ykstHYTEbSyq2YLrsRNG/diWC+KsqJSHOfls0M7
	FNDDoyejZGIm5F8EQIoXSHgjWsTvDUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-rVbeat0vMVWbEQKdpBOh3w-1; Fri, 29 May 2020 12:15:29 -0400
X-MC-Unique: rVbeat0vMVWbEQKdpBOh3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F05A1005510;
	Fri, 29 May 2020 16:15:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 949501002393;
	Fri, 29 May 2020 16:15:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E54A6EF47;
	Fri, 29 May 2020 16:15:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TGARvo026528 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 12:10:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80C0FF5AD0; Fri, 29 May 2020 16:10:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CC61F5AC3
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 16:10:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41AC4101A526
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 16:10:24 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-192-stTr1-FEP0SF6JsjI-F9kA-1; Fri, 29 May 2020 12:10:22 -0400
X-MC-Unique: stTr1-FEP0SF6JsjI-F9kA-1
Received: by mail-qt1-f195.google.com with SMTP id y1so2301268qtv.12
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 09:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=y+4rgbyVFdpWdnFfPGEMNo5bmNIxGC5yE0lzC9sLPDI=;
	b=XDMI1R07Py2hDfEGXdAW91ElpmQ5DFhcVYoxeI+p/jZHtwF1vpoOj05q/SPguBJPff
	HeCGWmKLevd2YRKJjUcpVMGzlJ38mopksm+L9/WAs8w+HkbSw2r8d/LNnvKD8dzLg64G
	4WTeabAFyqCbwqoTQZHalbe9y1xUJ8q0O7LGGhv1I2ix/QRKVCtVJw/6iLckpY6g0WxM
	C1R0TUW0qYIYgYT/FFfOtvN4me2Fc9LgD7GPFPhto7tRSQXj2kRi2SQsHMTffMG14yTe
	AvByXW6Hn0jLBA/TvlUJaeQWTuhJCXYriaxNQR3geNWqoEb0FLXam1UaldSQ5HqGpAl4
	n56g==
X-Gm-Message-State: AOAM532OM6sPI2t75l6Tuv3zqIq+wsMpe7RlRexlk7T8NkdwDwJ0V2BY
	hrOQh2WlivSyhyuHDz7Y108=
X-Google-Smtp-Source: ABdhPJwymhddx06bqmGhYsTfxrNsNdKqxYLST86rY0HaDO5CDiSL28xMj8JFIw+ygnudI/qKx7P/NQ==
X-Received: by 2002:ac8:7ca1:: with SMTP id z1mr8885022qtv.334.1590768621466; 
	Fri, 29 May 2020 09:10:21 -0700 (PDT)
Received: from localhost.localdomain
	([2001:1284:f013:516d:2604:bfa5:7157:afa1])
	by smtp.gmail.com with ESMTPSA id
	c83sm7579257qkb.103.2020.05.29.09.10.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 May 2020 09:10:20 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 6C60EC1B84; Fri, 29 May 2020 13:10:18 -0300 (-03)
Date: Fri, 29 May 2020 13:10:18 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200529161018.GK2491@localhost.localdomain>
References: <20200529120943.101454-1-hch@lst.de>
	<20200529120943.101454-5-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200529120943.101454-5-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, netdev@vger.kernel.org,
	Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	linux-sctp@vger.kernel.org, David Laight <David.Laight@aculab.com>,
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Cluster-devel] [PATCH 4/4] net: remove kernel_setsockopt
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 02:09:43PM +0200, Christoph Hellwig wrote:
> No users left.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>

Thanks.

> ---
>  include/linux/net.h |  2 --
>  net/socket.c        | 31 -------------------------------
>  2 files changed, 33 deletions(-)
> 
> diff --git a/include/linux/net.h b/include/linux/net.h
> index 74ef5d7315f70..e10f378194a59 100644
> --- a/include/linux/net.h
> +++ b/include/linux/net.h
> @@ -303,8 +303,6 @@ int kernel_connect(struct socket *sock, struct sockaddr *addr, int addrlen,
>  		   int flags);
>  int kernel_getsockname(struct socket *sock, struct sockaddr *addr);
>  int kernel_getpeername(struct socket *sock, struct sockaddr *addr);
> -int kernel_setsockopt(struct socket *sock, int level, int optname, char *optval,
> -		      unsigned int optlen);
>  int kernel_sendpage(struct socket *sock, struct page *page, int offset,
>  		    size_t size, int flags);
>  int kernel_sendpage_locked(struct sock *sk, struct page *page, int offset,
> diff --git a/net/socket.c b/net/socket.c
> index 81a98b6cbd087..976426d03f099 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -3624,37 +3624,6 @@ int kernel_getpeername(struct socket *sock, struct sockaddr *addr)
>  }
>  EXPORT_SYMBOL(kernel_getpeername);
>  
> -/**
> - *	kernel_setsockopt - set a socket option (kernel space)
> - *	@sock: socket
> - *	@level: API level (SOL_SOCKET, ...)
> - *	@optname: option tag
> - *	@optval: option value
> - *	@optlen: option length
> - *
> - *	Returns 0 or an error.
> - */
> -
> -int kernel_setsockopt(struct socket *sock, int level, int optname,
> -			char *optval, unsigned int optlen)
> -{
> -	mm_segment_t oldfs = get_fs();
> -	char __user *uoptval;
> -	int err;
> -
> -	uoptval = (char __user __force *) optval;
> -
> -	set_fs(KERNEL_DS);
> -	if (level == SOL_SOCKET)
> -		err = sock_setsockopt(sock, level, optname, uoptval, optlen);
> -	else
> -		err = sock->ops->setsockopt(sock, level, optname, uoptval,
> -					    optlen);
> -	set_fs(oldfs);
> -	return err;
> -}
> -EXPORT_SYMBOL(kernel_setsockopt);
> -
>  /**
>   *	kernel_sendpage - send a &page through a socket (kernel space)
>   *	@sock: socket
> -- 
> 2.26.2
> 

