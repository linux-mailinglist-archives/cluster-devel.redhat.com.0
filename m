Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A4E9E1DB618
	for <lists+cluster-devel@lfdr.de>; Wed, 20 May 2020 16:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589984336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dL/dIDKP7akScoeuR1nosVJ6aAQrCAaQ4P1jSyK7Oco=;
	b=FamysXMhmMb6I/p6bmfB2KvU5MiU833Kt8L2m3RNK41xT6FICUJYHEYY9ZgRA1bq1ZLroS
	7X0ygl3J5Yt/TZ8xKHxmihZLnTB1PwgbzR/aYyV1QeW3rL+ZsQqXXdlHmL00HZ/Xo8yReR
	QY2G845OGdwOGLf1ESdqMP1ukcuw/ww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-TF1HIW7tNSu_ICGmImEIVA-1; Wed, 20 May 2020 10:18:55 -0400
X-MC-Unique: TF1HIW7tNSu_ICGmImEIVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21245800688;
	Wed, 20 May 2020 14:18:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABA1460C05;
	Wed, 20 May 2020 14:18:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F3B91809543;
	Wed, 20 May 2020 14:18:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KEIhBF001677 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 10:18:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2720D2156A3A; Wed, 20 May 2020 14:18:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E8372156A2E
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 14:18:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C47BF811768
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 14:18:39 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-403--yIy2t1eNXG7sBghSJmT6g-1;
	Wed, 20 May 2020 10:18:34 -0400
X-MC-Unique: -yIy2t1eNXG7sBghSJmT6g-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9508368C4E; Wed, 20 May 2020 16:18:30 +0200 (CEST)
Date: Wed, 20 May 2020 16:18:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joe Perches <joe@perches.com>
Message-ID: <20200520141830.GA28867@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-21-hch@lst.de>
	<0ee5acfaca4cf32d4efad162046b858981a4dae3.camel@perches.com>
	<20200514103025.GB12680@lst.de>
	<9992a1fe768a0b1e9bb9470d2728ba25dbe042db.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <9992a1fe768a0b1e9bb9470d2728ba25dbe042db.camel@perches.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 04:51:26AM -0700, Joe Perches wrote:
> > Mostly to keep it symmetric with the sockopt.  I could probably remove
> > a few arguments in the series if we want to be strict.
> 
> My preference would use strict and add
> arguments only when necessary.

In a few cases that would create confusion as the arguments are rather
overloaded.  But for a lot of the cases where it doesn't and there isn't
really much use for other arguments I've done that now.

