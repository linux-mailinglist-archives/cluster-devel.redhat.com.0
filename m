Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CB764625FF
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jul 2019 18:20:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A0D130C5859;
	Mon,  8 Jul 2019 16:20:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5CC11001B32;
	Mon,  8 Jul 2019 16:20:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DE4318184A5;
	Mon,  8 Jul 2019 16:20:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x68GJYAw020473 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 12:19:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 546142026D5C; Mon,  8 Jul 2019 16:19:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EA3F2026D5B;
	Mon,  8 Jul 2019 16:19:32 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 646AA650B9;
	Mon,  8 Jul 2019 16:19:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B33B3227A81; Mon,  8 Jul 2019 18:19:12 +0200 (CEST)
Date: Mon, 8 Jul 2019 18:19:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20190708161912.GA10233@lst.de>
References: <20190701215439.19162-1-hch@lst.de>
	<20190708000103.GH7689@dread.disaster.area>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708000103.GH7689@dread.disaster.area>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.11.55.2]); Mon, 08 Jul 2019 16:19:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 08 Jul 2019 16:19:31 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'verein.lst.de' FROM:'hch@lst.de'
	RCPT:''
X-RedHat-Spam-Score: 0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 213.95.11.211 verein.lst.de 213.95.11.211
	verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.55.2
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 08 Jul 2019 16:20:24 +0000 (UTC)

On Mon, Jul 08, 2019 at 10:01:03AM +1000, Dave Chinner wrote:
> Ok, this doesn't look too bad from the iomap perspective, though it
> does raise more questions. :)
> 
> gfs2 now has two iopaths, right? One that uses bufferheads for
> journalled data, and the other that uses iomap? That seems like it's
> only a partial conversion - what needs to be done to iomap and gfs2
> to support the journalled data path so there's a single data IO
> path?

gfs2 always had to very different writeback I/O paths, including a copy
and pasted versiom of write_cache_pages for journaled data, they just
diverge a little bit more now. In the longer run I'd also like to add
journaled data support to iomap for use with XFS, and then also switch
gfs2 to it. 

