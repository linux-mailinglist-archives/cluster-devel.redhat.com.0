Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4936C1D2C6B
	for <lists+cluster-devel@lfdr.de>; Thu, 14 May 2020 12:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589451540;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EIOIe+aahZ8+SIH2F8KiUtFKi1cnEk4R+Gpw7heN5eg=;
	b=J/bmOBjHrZ02+IGdXFhqL/RT+rUSGCVy35NeDcXZmKPl8Cw6e4hFAo5fgnmbkHr02lIR/u
	HzraniYAGkgqw7OCQyfHjRduADv6fJNJ3vPBn64F1EiSd/OboDC1aOpXRmcwdpeA21YzuV
	W/bC9jyMJXAtN+HsauLnIbVVkTL+7l4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-G5ICQeZ_NSq83qUoLYRZjg-1; Thu, 14 May 2020 06:18:58 -0400
X-MC-Unique: G5ICQeZ_NSq83qUoLYRZjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3DFE18FE86C;
	Thu, 14 May 2020 10:18:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 506A910027AC;
	Thu, 14 May 2020 10:18:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD6854E985;
	Thu, 14 May 2020 10:18:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EAImbG014866 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 06:18:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CC8714192D; Thu, 14 May 2020 10:18:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5928A141938
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 10:18:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFFEB1019CA9
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 10:18:45 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-245-9KChJ0INNEyNM4oYtMu4hw-1;
	Thu, 14 May 2020 06:18:42 -0400
X-MC-Unique: 9KChJ0INNEyNM4oYtMu4hw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3F02D68BEB; Thu, 14 May 2020 12:18:38 +0200 (CEST)
Date: Thu, 14 May 2020 12:18:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20200514101838.GA12548@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
	<ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
	<756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Eric Dumazet <edumazet@google.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	'Joe Perches' <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>,
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
	Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 08:29:30AM +0000, David Laight wrote:
> You need to export functions that do most of the socket options
> for all protocols.

Only for those were we have users, and all those are covered.

