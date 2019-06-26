Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E24569D8
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 14:56:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 134543DD47;
	Wed, 26 Jun 2019 12:56:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7943760C4E;
	Wed, 26 Jun 2019 12:56:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57F943D87;
	Wed, 26 Jun 2019 12:55:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QCtnvX010801 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 08:55:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2CFD51001B0E; Wed, 26 Jun 2019 12:55:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEF391001281;
	Wed, 26 Jun 2019 12:55:46 +0000 (UTC)
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E91F1368E3;
	Wed, 26 Jun 2019 12:55:33 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id C479768B05; Wed, 26 Jun 2019 14:55:02 +0200 (CEST)
Date: Wed, 26 Jun 2019 14:55:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190626125502.GB4744@lst.de>
References: <20190626120333.13310-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626120333.13310-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Wed, 26 Jun 2019 12:55:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Wed, 26 Jun 2019 12:55:35 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'newverein.lst.de'
	FROM:'hch@lst.de' RCPT:''
X-RedHat-Spam-Score: -0.008  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 213.95.11.211 verein.lst.de 213.95.11.211
	verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
	linux-xfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH 1/2] iomap: don't mark the inode dirty
 in iomap_write_end
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 26 Jun 2019 12:56:27 +0000 (UTC)

On Wed, Jun 26, 2019 at 02:03:32PM +0200, Andreas Gruenbacher wrote:
> Marking the inode dirty for each page copied into the page cache can be
> very inefficient for file systems that use the VFS dirty inode tracking,
> and is completely pointless for those that don't use the VFS dirty inode
> tracking.  So instead, only set an iomap flag when changing the in-core
> inode size, and open code the rest of __generic_write_end.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Nitpick: a patch from you should never have me as the first signoff.
Just drop it, and if you feel fancy add a 'Partially based on code
from Christoph Hellwig.' sentence.  Not that I care much.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Doesn't the series also need a third patch reducing the amount
of mark_inode_dirty calls as per your initial proposal?

