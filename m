Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 269851D1EB4
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 21:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589397178;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cUn25SxuxChf/Vvm8XK4l5t21InzaSMjAVPKMvsYkI4=;
	b=Lm0oEXsC3a0RdiRfuEzSKzYxnRLraWWVAOJwKbk0Dh5Ce6zH1LAl2VWn+8mU3BSO77ASM1
	sPP3rtyLBA4B0HV9aESMCI9FzQPhbp2qXxZKgfToSOEAXJi3glBnFXIu9gJUdZ+1jfXDTd
	i7rZ13z9HRNWnQ3hhPZU3NIjD87tP7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-80CIvCIzNbCTiKUCFBiJDQ-1; Wed, 13 May 2020 15:12:56 -0400
X-MC-Unique: 80CIvCIzNbCTiKUCFBiJDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C197107ACCD;
	Wed, 13 May 2020 19:12:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA18034660;
	Wed, 13 May 2020 19:12:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB3911809543;
	Wed, 13 May 2020 19:12:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DJCNOv020724 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 15:12:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B5992156A50; Wed, 13 May 2020 19:12:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5202C2156A4B
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 19:12:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E11E7101A526
	for <cluster-devel@redhat.com>; Wed, 13 May 2020 19:12:18 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-288-i8i4KfFGO5if8LI9hSzO3A-1; Wed, 13 May 2020 15:12:15 -0400
X-MC-Unique: i8i4KfFGO5if8LI9hSzO3A-1
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 6900A127DD751;
	Wed, 13 May 2020 12:12:11 -0700 (PDT)
Date: Wed, 13 May 2020 12:12:10 -0700 (PDT)
Message-Id: <20200513.121210.1508400748648949138.davem@davemloft.net>
To: hch@lst.de
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Wed, 13 May 2020 12:12:12 -0700 (PDT)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: marcelo.leitner@gmail.com, edumazet@google.com,
	linux-nvme@lists.infradead.org, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	kuznet@ms2.inr.ac.ru, linux-block@vger.kernel.org,
	kuba@kernel.org, drbd-dev@tron.linbit.com,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	nhorman@tuxdriver.com, yoshfuji@linux-ipv6.org,
	netdev@vger.kernel.org, vyasevich@gmail.com,
	linux-kernel@vger.kernel.org, jmaloy@redhat.com,
	ying.xue@windriver.com, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] remove kernel_setsockopt and kernel_getsockopt
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
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

From: Christoph Hellwig <hch@lst.de>
Date: Wed, 13 May 2020 08:26:15 +0200

> Hi Dave,
> 
> this series removes the kernel_setsockopt and kernel_getsockopt
> functions, and instead switches their users to small functions that
> implement setting (or in one case getting) a sockopt directly using
> a normal kernel function call with type safety and all the other
> benefits of not having a function call.
> 
> In some cases these functions seem pretty heavy handed as they do
> a lock_sock even for just setting a single variable, but this mirrors
> the real setsockopt implementation - counter to that a few kernel
> drivers just set the fields directly already.
> 
> Nevertheless the diffstat looks quite promising:
> 
>  42 files changed, 721 insertions(+), 799 deletions(-)

Overall I'm fine with these changes, but three things need to happen
before I can think about applying this:

1) Address David's feedback about the ip_mtu*() calls that can occur
   on ipv6 sockets too.

2) Handle the feedback about dlm now bringing in sctp even if sctp
   sockets are not even used because of the symbol dependency.

3) Add the rxrpc documentation requested by David.

Thank you.

