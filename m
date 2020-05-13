Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6340E1D14BE
	for <lists+cluster-devel@lfdr.de>; Wed, 13 May 2020 15:26:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589376402;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=d/0WQiW+co/T0Lh806Aa2CF0lrVFjIjJV8t4w61WLTw=;
	b=YNs2IslkquS87CGoZIF+dwYSusSyaKMQMOGBp7G/r6TPNlrcSWInj/jE7M9U4dOTGUngJl
	m64GolPBV3KMV8Z5ur3zYEPlN6gPVXLmqJ0TK7rJ/coyd6y5CQx2OQAphs6hWgamHC+/pD
	fY77OkRxLoKduE2zK7sb7y8L81KW52A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-hgHbyYORP-ClW50qyDrcxg-1; Wed, 13 May 2020 09:26:39 -0400
X-MC-Unique: hgHbyYORP-ClW50qyDrcxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EF48A0BE0;
	Wed, 13 May 2020 13:26:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ED3F6A94A;
	Wed, 13 May 2020 13:26:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B4294CA95;
	Wed, 13 May 2020 13:26:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DDPUsC023611 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 09:25:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34266648DB; Wed, 13 May 2020 13:25:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com
	[10.10.112.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31ED9783B3;
	Wed, 13 May 2020 13:25:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200513062649.2100053-24-hch@lst.de>
References: <20200513062649.2100053-24-hch@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <3124570.1589376319.1@warthog.procyon.org.uk>
Date: Wed, 13 May 2020 14:25:19 +0100
Message-ID: <3124571.1589376319@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	dhowells@redhat.com, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 23/33] ipv6: add ip6_sock_set_recverr
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
Content-Type: text/plain; charset="us-ascii"

Christoph Hellwig <hch@lst.de> wrote:

> Add a helper to directly set the IPV6_RECVERR sockopt from kernel space
> without going through a fake uaccess.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: David Howells <dhowells@redhat.com>

