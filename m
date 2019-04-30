Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EE438101C4
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 23:25:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96CF7C02492F;
	Tue, 30 Apr 2019 21:25:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 705FE62480;
	Tue, 30 Apr 2019 21:25:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6FF2A18089CB;
	Tue, 30 Apr 2019 21:25:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3ULLtMN004886 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 17:21:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC8C781772; Tue, 30 Apr 2019 21:21:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63EBB81742;
	Tue, 30 Apr 2019 21:21:53 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246])
	by mx1.redhat.com (Postfix) with ESMTP id C513C300309A;
	Tue, 30 Apr 2019 21:21:51 +0000 (UTC)
Received: from dread.disaster.area (pa49-181-171-240.pa.nsw.optusnet.com.au
	[49.181.171.240])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 77CA143A20F;
	Wed,  1 May 2019 07:21:48 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92)
	(envelope-from <david@fromorbit.com>)
	id 1hLaCA-0004HS-TP; Wed, 01 May 2019 07:21:46 +1000
Date: Wed, 1 May 2019 07:21:46 +1000
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190430212146.GL1454@dread.disaster.area>
References: <20190429220934.10415-1-agruenba@redhat.com>
	<20190430025028.GA5200@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430025028.GA5200@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=UJetJGXy c=1 sm=1 tr=0 cx=a_idp_d
	a=LhzQONXuMOhFZtk4TmSJIw==:117 a=LhzQONXuMOhFZtk4TmSJIw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=E5NmQfObTbMA:10
	a=7-415B0cAAAA:8 a=JuDxSlhT3OO6blO4plAA:9 a=CjuIK1q_8ugA:10
	a=biEYGPWJfzWAr4FL6Ov7:22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 30 Apr 2019 21:21:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Tue, 30 Apr 2019 21:21:52 +0000 (UTC) for IP:'211.29.132.246'
	DOMAIN:'mail104.syd.optusnet.com.au'
	HELO:'mail104.syd.optusnet.com.au' FROM:'david@fromorbit.com'
	RCPT:''
X-RedHat-Spam-Score: -0.7 (RCVD_IN_DNSWL_LOW) 211.29.132.246
	mail104.syd.optusnet.com.au 211.29.132.246
	mail104.syd.optusnet.com.au <david@fromorbit.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Mark Syms <Mark.Syms@citrix.com>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v7 0/5] iomap and gfs2 fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 30 Apr 2019 21:25:09 +0000 (UTC)

On Mon, Apr 29, 2019 at 07:50:28PM -0700, Darrick J. Wong wrote:
> On Tue, Apr 30, 2019 at 12:09:29AM +0200, Andreas Gruenbacher wrote:
> > Here's another update of this patch queue, hopefully with all wrinkles
> > ironed out now.
> > 
> > Darrick, I think Linus would be unhappy seeing the first four patches in
> > the gfs2 tree; could you put them into the xfs tree instead like we did
> > some time ago already?
> 
> Sure.  When I'm done reviewing them I'll put them in the iomap tree,
> though, since we now have a separate one. :)

I'd just keep the iomap stuff in the xfs tree as a separate set of
branches and merge them into the XFS for-next when composing it.
That way it still gets plenty of test coverage from all the XFS
devs and linux next without anyone having to think about.

You really only need to send separate pull requests for the iomap
and XFS branches - IMO, there's no really need to have a complete
new tree for it...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

