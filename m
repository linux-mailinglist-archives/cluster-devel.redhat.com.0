Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4775C53C
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jul 2019 23:55:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01BE5C057F2E;
	Mon,  1 Jul 2019 21:55:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACADE7A4C6;
	Mon,  1 Jul 2019 21:55:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FDB71806B16;
	Mon,  1 Jul 2019 21:55:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61LssXH005853 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 17:54:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4551C17BAE; Mon,  1 Jul 2019 21:54:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02ED060BF3;
	Mon,  1 Jul 2019 21:54:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C3E1308FBB4;
	Mon,  1 Jul 2019 21:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jUXV+9Am0lafAQM2Xh/BLm9nT4mqaa+fGtIKeFlBAzI=;
	b=F/d2udAGSziQdw1cB6q1TqCFc
	J+vPGA6i9goMucdspM6yFZWOBz6OFrgDF5B621haiMwtYC0NZIs3ox+sN0g8TX6sAUdbCtHPNW02O
	58abFVVQxk4RpnA1B9RceZRybC05PPjJIQqp244Y5/LXhuWHcXsN4uPYU1AoIkJirX8q4nCX1cJTK
	SBwu4jRZBwCwIF0B0QY62bGO5lDhCzD04aCnb8Fxta5Az12mfVUtnL/xizJLKMDHzNJkQUZ3Z0zfY
	v/SodJ5cFbBkIvnlQnL7zk8Sp2CBXD2VMu/RWv23HKM29VF2DMFjTsKjuwAioEm1j4HqyhLxK87gW
	yN7KXgl5A==;
Received: from [38.98.37.141] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hi4G6-0000VM-IE; Mon, 01 Jul 2019 21:54:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon,  1 Jul 2019 23:54:24 +0200
Message-Id: <20190701215439.19162-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Mon, 01 Jul 2019 21:54:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 01 Jul 2019 21:54:48 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.297  (DKIM_SIGNED, DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+bb02ddf78a79a38d855c+5790+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
Subject: [Cluster-devel] RFC: use the iomap writepage path in gfs2
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 01 Jul 2019 21:55:10 +0000 (UTC)

Hi all,

in this straight from the jetplane edition I present the series to
convert gfs2 to full iomap usage for the ordered and writeback mode,
that is we use iomap_page everywhere and entirely get rid of
buffer_heads in the data path.  This has only seen basic testing
which ensured neither 4k or 1k blocksize in ordered mode regressed
vs the xfstests baseline, although that baseline tends to look
pretty bleak.

The series is to be applied on top of my "lift the xfs writepage code
into iomap v2" series.

