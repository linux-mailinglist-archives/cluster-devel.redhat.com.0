Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E7862598
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jul 2019 18:05:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BD05A14DE;
	Mon,  8 Jul 2019 16:04:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 226185C266;
	Mon,  8 Jul 2019 16:04:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 172CC18363C2;
	Mon,  8 Jul 2019 16:04:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x68G4KAf017931 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 12:04:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A9FFB1001B02; Mon,  8 Jul 2019 16:04:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75A0D1001DCB;
	Mon,  8 Jul 2019 16:04:18 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C15888317;
	Mon,  8 Jul 2019 16:03:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 28724227A81; Mon,  8 Jul 2019 18:03:52 +0200 (CEST)
Date: Mon, 8 Jul 2019 18:03:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190708160351.GA9871@lst.de>
References: <20190701215439.19162-1-hch@lst.de>
	<CAHc6FU5MHCdXENW_Y++hO_qhtCh4XtAHYOaTLzk+1KU=JNpPww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc6FU5MHCdXENW_Y++hO_qhtCh4XtAHYOaTLzk+1KU=JNpPww@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Mon, 08 Jul 2019 16:04:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Mon, 08 Jul 2019 16:04:05 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'verein.lst.de' FROM:'hch@lst.de'
	RCPT:''
X-RedHat-Spam-Score: 0.002  (SPF_HELO_NONE,
	SPF_NONE) 213.95.11.211 verein.lst.de 213.95.11.211
	verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>, Christoph Hellwig <hch@lst.de>,
	"Darrick J . Wong" <darrick.wong@oracle.com>
Subject: Re: [Cluster-devel] RFC: use the iomap writepage path in gfs2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 08 Jul 2019 16:05:02 +0000 (UTC)

On Thu, Jul 04, 2019 at 12:35:41AM +0200, Andreas Gruenbacher wrote:
> Patch "gfs2: implement gfs2_block_zero_range using iomap_zero_range"
> isn't quite ready: the gfs2 iomap operations don't handle IOMAP_ZERO
> correctly so far, and that needs to be fixed first.

What is the issue with IOMAP_ZERO on gfs2?  Zeroing never does block
allocations except when on COW extents, which gfs2 doesn't support,
so there shouldn't really be any need for additional handling.

> Some of the tests assume that the filesystem supports unwritten
> extents, trusted xattrs, the usrquota / grpquota / prjquota mount
> options. There shouldn't be a huge number of failing tests beyond
> that, but I know things aren't perfect.

In general xfstests is supposed to have tests for that and not run
the tests if not supported.  In most cases this is automatic, but
in case a feature can't be autodetect we have a few manual overrides.

