Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EFD5F1DCE21
	for <lists+cluster-devel@lfdr.de>; Thu, 21 May 2020 15:34:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590068053;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EQm3KwRvgaHxQ5d1Q4EsqwYQDDPz8ESa9iFyt4vvvfU=;
	b=JvfgKWPhq5C1eSgr7iZ4MwSSe9Lwfcftwx7lNh54SjMYGKVKp9iZNeUivzKyjNWTZFelGx
	EnhNYEC+e3cwUU/pDdnhh0vty2JdXfXIlkIgbakN1tgKpFuSd4hsDp8gZLpLYFvWZpO2JB
	dVev+xfIRPwkRaZ+y+CuTu9lE7ATIxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-Rk_8E_RUO9mSFGDYzDs-Jw-1; Thu, 21 May 2020 09:34:12 -0400
X-MC-Unique: Rk_8E_RUO9mSFGDYzDs-Jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 571A21853C73;
	Thu, 21 May 2020 13:34:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15AE560C84;
	Thu, 21 May 2020 13:34:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 646511809543;
	Thu, 21 May 2020 13:34:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04LDY0eN000416 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 May 2020 09:34:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B92852029F72; Thu, 21 May 2020 13:34:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8352A2028DCC
	for <cluster-devel@redhat.com>; Thu, 21 May 2020 13:33:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9991C81C895
	for <cluster-devel@redhat.com>; Thu, 21 May 2020 13:33:54 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-401-OWqrM483PgO6xzS62X12eA-1; Thu, 21 May 2020 09:33:52 -0400
X-MC-Unique: OWqrM483PgO6xzS62X12eA-1
Received: by mail-qt1-f194.google.com with SMTP id c24so5431574qtw.7;
	Thu, 21 May 2020 06:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=EQm3KwRvgaHxQ5d1Q4EsqwYQDDPz8ESa9iFyt4vvvfU=;
	b=gFxLhg8i18ohcoDeZ55B2Mz6U7VGLzVmymOuFYOS6mxFlNaIXi6gvhsz9803yfNWDn
	vNIGJPz5fZAZZ8zErLVJcXWdln6kNuxncnO7+l0HmEmAUqZ5zbRL/JkzEqQSZiJYm32e
	DNKrBrA1ULZ/PE9VleOLrTIgvpfptGB4JDtRghYU69SulUq8QuYmCe2hmKM+WEqzkZeh
	kAFFtB94DqMNRzK4x86QXJgddUAXpW/0tQl9Tw4ddDWrCeT4u5k2giAf5aRqNuuh3CYv
	/vXU8wXmtSK1LOTvn/xneBZe2thfQNkSCIs56kcwgc1cO8X0iHR91drMEYFWGj1dvHWm
	zj2Q==
X-Gm-Message-State: AOAM531tBtBusPxwQEwk9tLLk/N4L28+Yeqsm2v/0gjxJEl4jEuB7KpP
	jpo8M8iywuJJGspEI2sDXVU=
X-Google-Smtp-Source: ABdhPJzWBT98PJLkbYawA91UQ6OHszxicgo3NkwFTGAv08qIHw76JSy/EnOeEfPbcxMUsuNECRy/Lw==
X-Received: by 2002:aed:2bc4:: with SMTP id e62mr11045622qtd.263.1590068031488;
	Thu, 21 May 2020 06:33:51 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.225])
	by smtp.gmail.com with ESMTPSA id
	l184sm4861282qke.115.2020.05.21.06.33.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 May 2020 06:33:50 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 3AF26C0BEB; Thu, 21 May 2020 10:33:48 -0300 (-03)
Date: Thu, 21 May 2020 10:33:48 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200521133348.GX2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-32-hch@lst.de>
	<20200520231001.GU2491@localhost.localdomain>
	<20200520.162355.2212209708127373208.davem@davemloft.net>
	<20200520233913.GV2491@localhost.localdomain>
	<20200521083442.GA7771@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200521083442.GA7771@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: edumazet@google.com, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, kuznet@ms2.inr.ac.ru, kuba@kernel.org,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, nhorman@tuxdriver.com,
	yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
	vyasevich@gmail.com, linux-kernel@vger.kernel.org,
	jmaloy@redhat.com, ying.xue@windriver.com,
	David Miller <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2020 at 10:34:42AM +0200, Christoph Hellwig wrote:
> On Wed, May 20, 2020 at 08:39:13PM -0300, Marcelo Ricardo Leitner wrote:
> > On Wed, May 20, 2020 at 04:23:55PM -0700, David Miller wrote:
> > > From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> > > Date: Wed, 20 May 2020 20:10:01 -0300
> > > 
> > > > The duplication with sctp_setsockopt_nodelay() is quite silly/bad.
> > > > Also, why have the 'true' hardcoded? It's what dlm uses, yes, but the
> > > > API could be a bit more complete than that.
> > > 
> > > The APIs are being designed based upon what in-tree users actually
> > > make use of.  We can expand things later if necessary.
> > 
> > Sometimes expanding things later can be though, thus why the worry.
> > But ok, I get it. Thanks.
> > 
> > The comment still applies, though. (re the duplication)
> 
> Where do you see duplication?
> 
> sctp_setsockopt_nodelay does the following things:
> 
>  - verifies optlen, returns -EINVAL if it doesn't match
>  - calls get_user, returns -EFAULT on error
>  - converts the value from get_user to a boolean and assigns it
>    to sctp_sk(sk)->nodelay
>  - returns 0.
> 
> sctp_sock_set_nodelay does:
> 
>  - call lock_sock
>  - assign true to sctp_sk(sk)->nodelay
>  - call release_sock
>  - does not return an error code

With the patch there are now two ways of enabling nodelay. It may be
just a boolean set today, but if one wants to probe on it or if we
want to extend it with anything, say a debug msg, we have to do it in
two (very different) places.

