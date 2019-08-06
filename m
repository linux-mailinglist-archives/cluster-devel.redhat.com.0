Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ECE82AFF
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Aug 2019 07:31:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 470C3308403B;
	Tue,  6 Aug 2019 05:31:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68ECD5D9C9;
	Tue,  6 Aug 2019 05:31:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30F491800203;
	Tue,  6 Aug 2019 05:31:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x765UbPj024588 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Aug 2019 01:30:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB2CE100032A; Tue,  6 Aug 2019 05:30:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 843971000329;
	Tue,  6 Aug 2019 05:30:35 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 838937FDEC;
	Tue,  6 Aug 2019 05:30:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CF24068B05; Tue,  6 Aug 2019 07:30:31 +0200 (CEST)
Date: Tue, 6 Aug 2019 07:30:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190806053031.GD13409@lst.de>
References: <20190701215439.19162-1-hch@lst.de>
	<20190701215439.19162-16-hch@lst.de>
	<CAHc6FU4wtDwLv_TU6xydtO2h8P8jE1ddPjVqs8=NDFFDNEpiLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc6FU4wtDwLv_TU6xydtO2h8P8jE1ddPjVqs8=NDFFDNEpiLA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Tue, 06 Aug 2019 05:30:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Tue, 06 Aug 2019 05:30:34 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'verein.lst.de' FROM:'hch@lst.de'
	RCPT:''
X-RedHat-Spam-Score: 0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 213.95.11.211 verein.lst.de 213.95.11.211
	verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>, Christoph Hellwig <hch@lst.de>,
	"Darrick J . Wong" <darrick.wong@oracle.com>
Subject: Re: [Cluster-devel] [PATCH 15/15] gfs2: use iomap for buffered I/O
 in ordered and writeback mode
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 06 Aug 2019 05:31:07 +0000 (UTC)

On Mon, Aug 05, 2019 at 02:27:21PM +0200, Andreas Gruenbacher wrote:
> Christoph,
> 
> thanks again for this patch and the rest of the patch queue. There's
> one minor bug here (see below). With that and the gfs2_walk_metadata
> fix I've just posted to cluster-devel, this is now all working nicely.

Skipping through the full quote this was a missing set_page_dirty,
right?  Looks fine to me and sorry for messing this up.

