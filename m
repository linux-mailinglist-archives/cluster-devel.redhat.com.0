Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BCCD21D2CCE
	for <lists+cluster-devel@lfdr.de>; Thu, 14 May 2020 12:30:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589452201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=W8C5z8MNFubUwsg1O58m0v5GZXf+H0BdWgB6O+ACrDM=;
	b=KKTKJkoNDzevOtFzD8TjKnZ1MHneU1rEr25DudBE4B5+qHbzsFtfTOqpJKtq4Syeo13nju
	7KRc+BiCjxfgdI5jh9xilGAgzI2gzXX2qX+fF+lIsQi3znYqv6IhU7LXQDgce0xpn5rtR9
	HvDfvU9OHUvKXsmjL3r9uExsbRR+dns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-5io3MpBXOOOncpJaLQ0Gjw-1; Thu, 14 May 2020 06:30:00 -0400
X-MC-Unique: 5io3MpBXOOOncpJaLQ0Gjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5818E805726;
	Thu, 14 May 2020 10:29:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4791A5D9CA;
	Thu, 14 May 2020 10:29:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB7581809543;
	Thu, 14 May 2020 10:29:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EATSXt015508 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 06:29:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC9FC2166B27; Thu, 14 May 2020 10:29:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8CEB2157F25
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 10:29:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B6A3185A78B
	for <cluster-devel@redhat.com>; Thu, 14 May 2020 10:29:26 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-474-Az5LGvTRPQSu-UlWEJR9GQ-1;
	Thu, 14 May 2020 06:29:24 -0400
X-MC-Unique: Az5LGvTRPQSu-UlWEJR9GQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 03CE368BEB; Thu, 14 May 2020 12:29:20 +0200 (CEST)
Date: Thu, 14 May 2020 12:29:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Howells <dhowells@redhat.com>
Message-ID: <20200514102919.GA12680@lst.de>
References: <20200513062649.2100053-30-hch@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<3123534.1589375587@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3123534.1589375587@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 29/33] rxrpc_sock_set_min_security_level
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

On Wed, May 13, 2020 at 02:13:07PM +0100, David Howells wrote:
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > +int rxrpc_sock_set_min_security_level(struct sock *sk, unsigned int val);
> > +
> 
> Looks good - but you do need to add this to Documentation/networking/rxrpc.txt
> also, thanks.

That file doesn't exist, instead we now have a
cumentation/networking/rxrpc.rst in weird markup.  Where do you want this
to be added, and with what text?  Remember I don't really know what this
thing does, I just provide a shortcut.

