Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 158FA13C88F
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 16:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579103899;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Dm/mGXxOoNqSvOQHOmzid3CQAGn5V53iWRLwGqBluV8=;
	b=fi1A4CBrFX9I0RGyHzosNVzd0kkG/eahuuPzuA5UKx0Y7bZjvcpScgbCyWJW0yBDpZ4y/Z
	FJvpoF9B8qfjBCk1PtfwoNIBt48nvnPwu62d5XCkw8mueNYILm6rV6bplX2mly1tQQArap
	tzuLGgSUJdiSfSKKyYxLPX2CZDKxGxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-0fC50TGIO6eSyllqg4Hytw-1; Wed, 15 Jan 2020 10:58:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0149A803BC0;
	Wed, 15 Jan 2020 15:58:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E189C10841AB;
	Wed, 15 Jan 2020 15:58:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C203618089CE;
	Wed, 15 Jan 2020 15:58:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FFwCBF013879 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 10:58:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B6C8CED164; Wed, 15 Jan 2020 15:58:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2BB6ED169
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 15:58:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63BE3802A51
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 15:58:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-397-3ktbVfaBORKkzgWH2kmV4Q-1; Wed, 15 Jan 2020 10:58:08 -0500
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irkkc-0005PY-Jn
	for cluster-devel@redhat.com; Wed, 15 Jan 2020 15:38:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: cluster-devel@redhat.com
Date: Wed, 15 Jan 2020 16:38:28 +0100
Message-Id: <20200115153830.440420-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: 3ktbVfaBORKkzgWH2kmV4Q-1
X-MC-Unique: 0fC50TGIO6eSyllqg4Hytw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00FFwCBF013879
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] RFC: gfs2 O_SYNC fix
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi gfs2 maintainers,

can you take a look at this completely untested series?  I found some
O_SYNC handling issues during code inspection for the direct I/O
locking revamp.



