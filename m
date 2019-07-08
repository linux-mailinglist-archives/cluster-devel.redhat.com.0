Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CB4618A1
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jul 2019 02:03:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A428D30832E9;
	Mon,  8 Jul 2019 00:03:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A6E55C226;
	Mon,  8 Jul 2019 00:03:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2616718184A4;
	Mon,  8 Jul 2019 00:03:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6802V5R025018 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 7 Jul 2019 20:02:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CFF385C22F; Mon,  8 Jul 2019 00:02:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79FB35C226;
	Mon,  8 Jul 2019 00:02:29 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246])
	by mx1.redhat.com (Postfix) with ESMTP id 7C285308FC5F;
	Mon,  8 Jul 2019 00:02:11 +0000 (UTC)
Received: from dread.disaster.area (pa49-195-139-63.pa.nsw.optusnet.com.au
	[49.195.139.63])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id A9A4643B878;
	Mon,  8 Jul 2019 10:02:10 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92)
	(envelope-from <david@fromorbit.com>)
	id 1hkH5b-0006vw-J9; Mon, 08 Jul 2019 10:01:03 +1000
Date: Mon, 8 Jul 2019 10:01:03 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190708000103.GH7689@dread.disaster.area>
References: <20190701215439.19162-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701215439.19162-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=P6RKvmIu c=1 sm=1 tr=0 cx=a_idp_d
	a=fNT+DnnR6FjB+3sUuX8HHA==:117 a=fNT+DnnR6FjB+3sUuX8HHA==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=0o9FgrsRnhwA:10
	a=7-415B0cAAAA:8 a=BIJwB3zSu3MTrXN99fEA:9 a=CjuIK1q_8ugA:10
	a=biEYGPWJfzWAr4FL6Ov7:22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 08 Jul 2019 00:02:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 08 Jul 2019 00:02:11 +0000 (UTC) for IP:'211.29.132.246'
	DOMAIN:'mail104.syd.optusnet.com.au'
	HELO:'mail104.syd.optusnet.com.au' FROM:'david@fromorbit.com'
	RCPT:''
X-RedHat-Spam-Score: -0.698  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_NONE) 211.29.132.246 mail104.syd.optusnet.com.au
	211.29.132.246 mail104.syd.optusnet.com.au
	<david@fromorbit.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, "Darrick J . Wong" <darrick.wong@oracle.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 08 Jul 2019 00:03:35 +0000 (UTC)

On Mon, Jul 01, 2019 at 11:54:24PM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> in this straight from the jetplane edition I present the series to
> convert gfs2 to full iomap usage for the ordered and writeback mode,
> that is we use iomap_page everywhere and entirely get rid of
> buffer_heads in the data path.  This has only seen basic testing
> which ensured neither 4k or 1k blocksize in ordered mode regressed
> vs the xfstests baseline, although that baseline tends to look
> pretty bleak.
> 
> The series is to be applied on top of my "lift the xfs writepage code
> into iomap v2" series.

Ok, this doesn't look too bad from the iomap perspective, though it
does raise more questions. :)

gfs2 now has two iopaths, right? One that uses bufferheads for
journalled data, and the other that uses iomap? That seems like it's
only a partial conversion - what needs to be done to iomap and gfs2
to support the journalled data path so there's a single data IO
path?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

