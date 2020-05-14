Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 511401D2ED0
	for <lists+cluster-devel@lfdr.de>; Thu, 14 May 2020 13:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589457111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kCPB4DbeWXf1NLoS4hw7Oj7Mv9WH/F84k5iT/ngO8wI=;
	b=Ut8zV3lVg3feQWo2XJmP/Gy3U9fxSW5UN45onP3L0H4gWyna20v4aR8XbTbZzsYRrsh2cK
	F/VvVSMBnyU1Dl0TLpOPJit7wcCzm3vR0DFkIB0ykCYr1Ohaj56pB1aew5GKN9MZptmt60
	/pMkwPm1YGl2Cp9ENihnsTMhqQzQdD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-zFcHOIrQNlm_4GYdc9dFgA-1; Thu, 14 May 2020 07:51:49 -0400
X-MC-Unique: zFcHOIrQNlm_4GYdc9dFgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 826A18018A1;
	Thu, 14 May 2020 11:51:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29E9082A0A;
	Thu, 14 May 2020 11:51:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 275284E987;
	Thu, 14 May 2020 11:51:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EBpdiQ021157 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 07:51:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6156A2029F77; Thu, 14 May 2020 11:51:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B0F02026FFE
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 11:51:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 929D081C886
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 11:51:34 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0055.hostedemail.com
	[216.40.44.55]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-83-PTypf-nvPZ6_jUugHeMugA-1; Thu, 14 May 2020 07:51:32 -0400
X-MC-Unique: PTypf-nvPZ6_jUugHeMugA-1
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay02.hostedemail.com (Postfix) with ESMTP id 82BDA2C1F;
	Thu, 14 May 2020 11:51:31 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:599:968:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3871:3872:3874:4321:5007:6742:6743:10004:10400:10848:11232:11658:11914:12296:12297:12740:12760:12895:13069:13160:13229:13311:13357:13439:14659:21080:21611:21627:30054:30090:30091,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:1, LUA_SUMMARY:none
X-HE-Tag: soup46_cc3a3aa2090a
X-Filterd-Recvd-Size: 2294
Received: from XPS-9350.home (unknown [47.151.136.130])
	(Authenticated sender: joe@perches.com)
	by omf01.hostedemail.com (Postfix) with ESMTPA;
	Thu, 14 May 2020 11:51:27 +0000 (UTC)
Message-ID: <9992a1fe768a0b1e9bb9470d2728ba25dbe042db.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Christoph Hellwig <hch@lst.de>
Date: Thu, 14 May 2020 04:51:26 -0700
In-Reply-To: <20200514103025.GB12680@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-21-hch@lst.de>
	<0ee5acfaca4cf32d4efad162046b858981a4dae3.camel@perches.com>
	<20200514103025.GB12680@lst.de>
User-Agent: Evolution 3.36.1-2
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Vlad,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	linux-sctp@vger.kernel.org, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On Thu, 2020-05-14 at 12:30 +0200, Christoph Hellwig wrote:
> On Wed, May 13, 2020 at 02:00:43PM -0700, Joe Perches wrote:
> > On Wed, 2020-05-13 at 08:26 +0200, Christoph Hellwig wrote:
> > > Add a helper to directly set the IP_RECVERR sockopt from kernel space
> > > without going through a fake uaccess.
> > 
> > This seems used only with true as the second arg.
> > Is there reason to have that argument at all?
> 
> Mostly to keep it symmetric with the sockopt.  I could probably remove
> a few arguments in the series if we want to be strict.

My preference would use strict and add
arguments only when necessary.


