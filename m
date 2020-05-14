Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 00A501D3DA1
	for <lists+cluster-devel@lfdr.de>; Thu, 14 May 2020 21:36:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589484962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2cAIpvlCjeek2UlOhaJLhP9ft/jEX+ktFmYjxRqXe+8=;
	b=aASS7vePo95d4Ruub8ZL1l4K3mrRG6FuMAu6TJSr9lumK1ZTx3XDQJv4VEK2AHGqdtNT0P
	BaTjMvpO+0KD8+AqEqQAsrKmRi+O52kevt56fP0qbXINKgHji3l6DRa8/HfzDOKosgweM8
	t20ncYlFn4KjHa5IZMssnZ6B2UTYCC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-5k7FAnq1MAKgwltHP8Q54w-1; Thu, 14 May 2020 15:35:59 -0400
X-MC-Unique: 5k7FAnq1MAKgwltHP8Q54w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79DB183DB39;
	Thu, 14 May 2020 19:35:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B1905C1D3;
	Thu, 14 May 2020 19:35:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 370E11809543;
	Thu, 14 May 2020 19:35:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EJZl4Q002456 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 15:35:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C85612156A4A; Thu, 14 May 2020 19:35:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F782166BA4
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 19:35:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBEDE8995DE
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 19:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-173-4z1-g93RMNKNK2pOUpN9eg-1; Thu, 14 May 2020 15:35:42 -0400
X-MC-Unique: 4z1-g93RMNKNK2pOUpN9eg-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jZJdf-0003fM-JH; Thu, 14 May 2020 19:35:27 +0000
Date: Thu, 14 May 2020 12:35:27 -0700
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Message-ID: <20200514193527.GB16070@bombadil.infradead.org>
References: <20200513062649.2100053-1-hch@lst.de>
	<ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
	<756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
	<20200514101838.GA12548@lst.de>
	<a76440f7305c4653877ff2abff499f4e@AcuMS.aculab.com>
	<20200514103450.GA12901@lst.de>
	<c2034daa0a23454abb5e5c5714807735@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <c2034daa0a23454abb5e5c5714807735@AcuMS.aculab.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Eric Dumazet <edumazet@google.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	'Christoph Hellwig' <hch@lst.de>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Ying Xue <ying.xue@windriver.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	"drbd-dev@lists.linbit.com" <drbd-dev@tron.linbit.com>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jon Maloy <jmaloy@redhat.com>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	'Joe Perches' <joe@perches.com>, "David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [Ocfs2-devel] remove kernel_setsockopt and
	kernel_getsockopt
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

On Thu, May 14, 2020 at 11:11:34AM +0000, David Laight wrote:
> From: 'Christoph Hellwig'
> > Sent: 14 May 2020 11:35
> > On Thu, May 14, 2020 at 10:26:41AM +0000, David Laight wrote:
> > > From: Christoph Hellwig
> > > > Only for those were we have users, and all those are covered.
> > >
> > > What do we tell all our users when our kernel SCTP code
> > > no longer works?
> > 
> > We only care about in-tree modules, just like for every other interface
> > in the kernel.
> 
> Even if our management agreed to release the code and the code
> layout matched the kernel guidelines you still wouldn't want
> two large drivers that implement telephony functionality
> for hardware that very few people actually have.

Oh, good point, we'll change the policy for all modules and make every
interface in the kernel stable from now on to cater to your special case.

