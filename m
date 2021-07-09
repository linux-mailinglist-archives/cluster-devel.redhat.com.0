Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8613C1F49
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jul 2021 08:25:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-3Rd32qzmOU-4KjzVDHKrQQ-1; Fri, 09 Jul 2021 02:25:19 -0400
X-MC-Unique: 3Rd32qzmOU-4KjzVDHKrQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38212100C609;
	Fri,  9 Jul 2021 06:25:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28B50175B8;
	Fri,  9 Jul 2021 06:25:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEDE21809C99;
	Fri,  9 Jul 2021 06:25:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1696MPFM025526 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Jul 2021 02:22:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CAEE2208AB8C; Fri,  9 Jul 2021 06:22:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6647208BDF9
	for <cluster-devel@redhat.com>; Fri,  9 Jul 2021 06:22:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CFA489B841
	for <cluster-devel@redhat.com>; Fri,  9 Jul 2021 06:22:23 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-578-YCDk4sGXMGSMwY6AbUytgQ-1; Fri, 09 Jul 2021 02:22:21 -0400
X-MC-Unique: YCDk4sGXMGSMwY6AbUytgQ-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1m1jtH-00EDVO-A2; Fri, 09 Jul 2021 06:21:42 +0000
Date: Fri, 9 Jul 2021 07:21:35 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <YOfq7+tS/7xEQora@infradead.org>
References: <20210707115524.2242151-1-agruenba@redhat.com>
	<20210707115524.2242151-3-agruenba@redhat.com>
	<YOW6Hz0/FgQkQDgm@casper.infradead.org>
	<20210709042737.GT11588@locust>
MIME-Version: 1.0
In-Reply-To: <20210709042737.GT11588@locust>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v3 2/3] iomap: Don't create iomap_page
 objects for inline files
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 08, 2021 at 09:27:37PM -0700, Darrick J. Wong wrote:
> I was under the impression that for blksize<pagesize filesystems, the
> page always had to have an iop attached.

Currently it does.  But I've talked since day one of the !bufferhead
iomap code that we should eventually lift that.

