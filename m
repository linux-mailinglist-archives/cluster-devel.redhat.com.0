Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 815871D2CD6
	for <lists+cluster-devel@lfdr.de>; Thu, 14 May 2020 12:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589452242;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uRuGC5/4FS6BRJ8bH/C3OzQ2Z/DHPfJubXIHTYeKsR4=;
	b=K53eoMuuSfyfLcz1+Z8HkPkve/ibPS84P9/lbSmWfYIfaN1WYUMaVjwilygUA3abm79Vtv
	RBntKMxIBa4NldpoO7EJTkCdYCN1A025peNFKy3eNda10zdPqwRTq+QzmcmBoib9lAFRkM
	i5NuxwNt454ozE9WWp1UVOw/htUnUl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-Y1bF6HLkPX26e-B3kgtnpg-1; Thu, 14 May 2020 06:30:40 -0400
X-MC-Unique: Y1bF6HLkPX26e-B3kgtnpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 810438018A6;
	Thu, 14 May 2020 10:30:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E66310013D9;
	Thu, 14 May 2020 10:30:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 348EF4E985;
	Thu, 14 May 2020 10:30:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EAUZvf015578 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 06:30:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BE7C2029F6F; Thu, 14 May 2020 10:30:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FDA920182A6
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 10:30:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1580B18A6663
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 10:30:33 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-369-8VSpFvYoNqabDIg1qkdzRg-1;
	Thu, 14 May 2020 06:30:28 -0400
X-MC-Unique: 8VSpFvYoNqabDIg1qkdzRg-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5131B68BEB; Thu, 14 May 2020 12:30:26 +0200 (CEST)
Date: Thu, 14 May 2020 12:30:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joe Perches <joe@perches.com>
Message-ID: <20200514103025.GB12680@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-21-hch@lst.de>
	<0ee5acfaca4cf32d4efad162046b858981a4dae3.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <0ee5acfaca4cf32d4efad162046b858981a4dae3.camel@perches.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 02:00:43PM -0700, Joe Perches wrote:
> On Wed, 2020-05-13 at 08:26 +0200, Christoph Hellwig wrote:
> > Add a helper to directly set the IP_RECVERR sockopt from kernel space
> > without going through a fake uaccess.
> 
> This seems used only with true as the second arg.
> Is there reason to have that argument at all?

Mostly to keep it symmetric with the sockopt.  I could probably remove
a few arguments in the series if we want to be strict.

