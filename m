Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 467BCF436
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 12:29:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C5CD307D983;
	Tue, 30 Apr 2019 10:29:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83F5E2A19A;
	Tue, 30 Apr 2019 10:29:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA45C3FB11;
	Tue, 30 Apr 2019 10:29:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UATlrC009796 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 06:29:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF1F16D094; Tue, 30 Apr 2019 10:29:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A20746C52C;
	Tue, 30 Apr 2019 10:29:44 +0000 (UTC)
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AAEFAC2D9;
	Tue, 30 Apr 2019 10:29:43 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id C4D9C67358; Tue, 30 Apr 2019 12:29:25 +0200 (CEST)
Date: Tue, 30 Apr 2019 12:29:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190430102925.GA19506@lst.de>
References: <20190429220934.10415-1-agruenba@redhat.com>
	<20190429220934.10415-3-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429220934.10415-3-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Tue, 30 Apr 2019 10:29:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 30 Apr 2019 10:29:43 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'newverein.lst.de'
	FROM:'hch@lst.de' RCPT:''
X-RedHat-Spam-Score: -0.01 (RCVD_IN_DNSWL_NONE) 213.95.11.211 verein.lst.de
	213.95.11.211 verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J . Wong" <darrick.wong@oracle.com>,
	Dave Chinner <david@fromorbit.com>,
	Mark Syms <Mark.Syms@citrix.com>, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v7 2/5] fs: Turn __generic_write_end
 into a void function
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 30 Apr 2019 10:29:56 +0000 (UTC)

On Tue, Apr 30, 2019 at 12:09:31AM +0200, Andreas Gruenbacher wrote:
> The VFS-internal __generic_write_end helper always returns the value of
> its @copied argument.  This can be confusing, and it isn't very useful
> anyway, so turn __generic_write_end into a function returning void
> instead.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

