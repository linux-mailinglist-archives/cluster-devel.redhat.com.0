Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D172B1E7D6D
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 14:43:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590756188;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VtzD/DOrIbOSbWqnH7ekyZS7ktdyydGbSi7u5pKRl0c=;
	b=WYm/pK5jbxQ0NlSmpRFcvNr4BBfLPiRdZAkPGwoiwRueJlqcNzGBldHHbabEvdzHLB3bsm
	5jjdsd2VIbF1zIEBZKPY4kw0h9O7irXm4rg9nY24gC1Y2TUb8CsGC42JTQKxXPD2Ri1Cyl
	Eq8nh4tRTDErpJXUCTS9Po104YvjHhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-Odn8OUvNNumKZhwAtnE1bg-1; Fri, 29 May 2020 08:43:07 -0400
X-MC-Unique: Odn8OUvNNumKZhwAtnE1bg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F3708010FC;
	Fri, 29 May 2020 12:43:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 519702BFF9;
	Fri, 29 May 2020 12:43:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0761F7CCC6;
	Fri, 29 May 2020 12:43:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TCe2qB009424 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 08:40:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34DA12026E1C; Fri, 29 May 2020 12:40:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 282F72026DFD
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 12:39:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 519EE8007DF
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 12:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-286-fAsSqVexN0qTUqGHgAnrGQ-1; Fri, 29 May 2020 08:39:57 -0400
X-MC-Unique: fAsSqVexN0qTUqGHgAnrGQ-1
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jedpf-0006KS-K2; Fri, 29 May 2020 12:09:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Vlad Yasevich <vyasevich@gmail.com>, Neil Horman <nhorman@tuxdriver.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Date: Fri, 29 May 2020 14:09:39 +0200
Message-Id: <20200529120943.101454-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org, David Laight <David.Laight@ACULAB.COM>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] remove kernel_setsockopt v4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi Dave and Marcelo,

now that only the dlm calls to sctp are left for kernel_setsockopt,
while we haven't really made much progress with the sctp setsockopt
refactoring, how about this small series that splits out a
sctp_setsockopt_bindx_kernel that takes a kernel space address array
to share more code as requested by Marcelo.  This should fit in with
whatever variant of the refator of sctp setsockopt we go with, but
just solved the immediate problem for now.

Changes since v3:
 - dropped all the merged patches, just sctp setsockopt left now
 - factor out a new sctp_setsockopt_bindx_kernel helper instead of
   duplicating a small amount of logic

Changes since v2:
 - drop the separately merged kernel_getopt_removal
 - drop the sctp patches, as there is conflicting cleanup going on
 - add an additional ACK for the rxrpc changes

Changes since v1:
 - use ->getname for sctp sockets in dlm
 - add a new ->bind_add struct proto method for dlm/sctp
 - switch the ipv6 and remaining sctp helpers to inline function so that
   the ipv6 and sctp modules are not pulled in by any module that could
   potentially use ipv6 or sctp connections
 - remove arguments to various sock_* helpers that are always used with
   the same constant arguments

