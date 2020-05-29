Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 826961E8316
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 18:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590768360;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pd5lAZmWnGQEg9my+K8yqiGBxQw7BvJ1dx+ybceAc+M=;
	b=PqtGvmNLWHFDbvjOSNIEBXJYvRSKxW+dHfSzGnzNnLEDz9dNxFu+164HMThaHZEsV1VD/+
	UjH35lb5Oo5x0Lqe4H9q/SerVe37ZaruE7tWZG88NN3PzTosX3IpcSwqxY/k/IFIqT7NPr
	aEZMAg86ILh+YHzcTBBnNomcYihnV0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-xjitXQXoOka0gHb6mJovEQ-1; Fri, 29 May 2020 12:05:58 -0400
X-MC-Unique: xjitXQXoOka0gHb6mJovEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FDA7A0BD7;
	Fri, 29 May 2020 16:05:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6078B5C1C8;
	Fri, 29 May 2020 16:05:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26C8F6EF47;
	Fri, 29 May 2020 16:05:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TG5rO4025904 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 12:05:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30ED310CB29C; Fri, 29 May 2020 16:05:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CDDC10CB295
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 16:05:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D017C101A526
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 16:05:50 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-250-2soidnSwP4adNPGSGP_s8g-1; Fri, 29 May 2020 12:05:48 -0400
X-MC-Unique: 2soidnSwP4adNPGSGP_s8g-1
Received: by mail-qk1-f194.google.com with SMTP id s1so2639844qkf.9
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 09:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=pd5lAZmWnGQEg9my+K8yqiGBxQw7BvJ1dx+ybceAc+M=;
	b=Ukid1QXhMSSqpRKQ4js7nNEh3ItFor6iBTU1Lr7/+1+nVLsv4gkw2mwVKyQpdtKBp6
	gDSJ9gi3EgBUZEEOP+g35C2UPlqyLB4mcTRn9hNgD63A7Abs2skSM5OIzDQ9d42Y0AwR
	Z5+UWl8onHplohl+dH/sDtvXz/uL2iUBf7OuFFPmGm5wXJX3Y7YAcC7Ib2MFgfDksMUC
	6tLGTnGqwXt0niJHNHZNZOJHICx2IRNmD2kpypKyv/GpL3NGt/eFXpASvyH7diii/WkB
	e4ul+xnhxoGRP30Nuw/dMoTHh1/njAtNcdJsSwftFSbGlY4VyTCh20j4aI9ttjKfYzLk
	Iu0w==
X-Gm-Message-State: AOAM531H7Xn0qoCHftfMjIdmCk5QqlSTEAL8DdiOuBuQueegqpipf0/L
	dSAoC43OfuR+FXAjdAZ8sn20hbbDP4lknw==
X-Google-Smtp-Source: ABdhPJzmHd7SDMPI2q+JYngCQ2RfZPvDlFDGRklGnRQrYU+7mGWuhiht9GIratK6mbSYxK77dID42g==
X-Received: by 2002:a37:b446:: with SMTP id d67mr1200068qkf.136.1590768347949; 
	Fri, 29 May 2020 09:05:47 -0700 (PDT)
Received: from localhost.localdomain
	([2001:1284:f013:516d:2604:bfa5:7157:afa1])
	by smtp.gmail.com with ESMTPSA id
	p10sm6755496qkm.121.2020.05.29.09.05.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 May 2020 09:05:47 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id D94A7C1B84; Fri, 29 May 2020 13:05:44 -0300 (-03)
Date: Fri, 29 May 2020 13:05:44 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200529160544.GI2491@localhost.localdomain>
References: <20200529120943.101454-1-hch@lst.de>
	<20200529120943.101454-3-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200529120943.101454-3-hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, netdev@vger.kernel.org,
	Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	linux-sctp@vger.kernel.org, David Laight <David.Laight@aculab.com>,
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Cluster-devel] [PATCH 2/4] sctp: refactor sctp_setsockopt_bindx
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

On Fri, May 29, 2020 at 02:09:41PM +0200, Christoph Hellwig wrote:
> Split out a sctp_setsockopt_bindx_kernel that takes a kernel pointer
> to the sockaddr and make sctp_setsockopt_bindx a small wrapper around
> it.  This prepares for adding a new bind_add proto op.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>

> ---
>  net/sctp/socket.c | 61 ++++++++++++++++++++++-------------------------
>  1 file changed, 28 insertions(+), 33 deletions(-)
> 
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index 827a9903ee288..6e745ac3c4a59 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -972,23 +972,22 @@ int sctp_asconf_mgmt(struct sctp_sock *sp, struct sctp_sockaddr_entry *addrw)
>   * it.
>   *
>   * sk        The sk of the socket
> - * addrs     The pointer to the addresses in user land
> + * addrs     The pointer to the addresses
>   * addrssize Size of the addrs buffer
>   * op        Operation to perform (add or remove, see the flags of
>   *           sctp_bindx)
>   *
>   * Returns 0 if ok, <0 errno code on error.
>   */
> -static int sctp_setsockopt_bindx(struct sock *sk,
> -				 struct sockaddr __user *addrs,
> -				 int addrs_size, int op)
> +static int sctp_setsockopt_bindx_kernel(struct sock *sk,
> +					struct sockaddr *addrs, int addrs_size,
> +					int op)
>  {
> -	struct sockaddr *kaddrs;
>  	int err;
>  	int addrcnt = 0;
>  	int walk_size = 0;
>  	struct sockaddr *sa_addr;
> -	void *addr_buf;
> +	void *addr_buf = addrs;
>  	struct sctp_af *af;
>  
>  	pr_debug("%s: sk:%p addrs:%p addrs_size:%d opt:%d\n",
> @@ -997,17 +996,10 @@ static int sctp_setsockopt_bindx(struct sock *sk,
>  	if (unlikely(addrs_size <= 0))
>  		return -EINVAL;
>  
> -	kaddrs = memdup_user(addrs, addrs_size);
> -	if (IS_ERR(kaddrs))
> -		return PTR_ERR(kaddrs);
> -
>  	/* Walk through the addrs buffer and count the number of addresses. */
> -	addr_buf = kaddrs;
>  	while (walk_size < addrs_size) {
> -		if (walk_size + sizeof(sa_family_t) > addrs_size) {
> -			kfree(kaddrs);
> +		if (walk_size + sizeof(sa_family_t) > addrs_size)
>  			return -EINVAL;
> -		}
>  
>  		sa_addr = addr_buf;
>  		af = sctp_get_af_specific(sa_addr->sa_family);
> @@ -1015,10 +1007,8 @@ static int sctp_setsockopt_bindx(struct sock *sk,
>  		/* If the address family is not supported or if this address
>  		 * causes the address buffer to overflow return EINVAL.
>  		 */
> -		if (!af || (walk_size + af->sockaddr_len) > addrs_size) {
> -			kfree(kaddrs);
> +		if (!af || (walk_size + af->sockaddr_len) > addrs_size)
>  			return -EINVAL;
> -		}
>  		addrcnt++;
>  		addr_buf += af->sockaddr_len;
>  		walk_size += af->sockaddr_len;
> @@ -1029,31 +1019,36 @@ static int sctp_setsockopt_bindx(struct sock *sk,
>  	case SCTP_BINDX_ADD_ADDR:
>  		/* Allow security module to validate bindx addresses. */
>  		err = security_sctp_bind_connect(sk, SCTP_SOCKOPT_BINDX_ADD,
> -						 (struct sockaddr *)kaddrs,
> -						 addrs_size);
> +						 addrs, addrs_size);
>  		if (err)
> -			goto out;
> -		err = sctp_bindx_add(sk, kaddrs, addrcnt);
> +			return err;
> +		err = sctp_bindx_add(sk, addrs, addrcnt);
>  		if (err)
> -			goto out;
> -		err = sctp_send_asconf_add_ip(sk, kaddrs, addrcnt);
> -		break;
> -
> +			return err;
> +		return sctp_send_asconf_add_ip(sk, addrs, addrcnt);
>  	case SCTP_BINDX_REM_ADDR:
> -		err = sctp_bindx_rem(sk, kaddrs, addrcnt);
> +		err = sctp_bindx_rem(sk, addrs, addrcnt);
>  		if (err)
> -			goto out;
> -		err = sctp_send_asconf_del_ip(sk, kaddrs, addrcnt);
> -		break;
> +			return err;
> +		return sctp_send_asconf_del_ip(sk, addrs, addrcnt);
>  
>  	default:
> -		err = -EINVAL;
> -		break;
> +		return -EINVAL;
>  	}
> +}
>  
> -out:
> -	kfree(kaddrs);
> +static int sctp_setsockopt_bindx(struct sock *sk,
> +				 struct sockaddr __user *addrs,
> +				 int addrs_size, int op)
> +{
> +	struct sockaddr *kaddrs;
> +	int err;
>  
> +	kaddrs = memdup_user(addrs, addrs_size);
> +	if (IS_ERR(kaddrs))
> +		return PTR_ERR(kaddrs);
> +	err = sctp_setsockopt_bindx_kernel(sk, kaddrs, addrs_size, op);
> +	kfree(kaddrs);
>  	return err;
>  }
>  
> -- 
> 2.26.2
> 

