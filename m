Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F5EB03
	for <lists+cluster-devel@lfdr.de>; Mon, 29 Apr 2019 21:43:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0789B30832F4;
	Mon, 29 Apr 2019 19:42:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E5A01001281;
	Mon, 29 Apr 2019 19:42:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AE4818089CB;
	Mon, 29 Apr 2019 19:42:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TJgnsp012975 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 15:42:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C17645799; Mon, 29 Apr 2019 19:42:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9478019749;
	Mon, 29 Apr 2019 19:42:47 +0000 (UTC)
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D3BE308429B;
	Mon, 29 Apr 2019 19:42:45 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 2E5FB68AFE; Mon, 29 Apr 2019 21:42:28 +0200 (CEST)
Date: Mon, 29 Apr 2019 21:42:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190429194227.GA6138@lst.de>
References: <20190429163239.4874-1-agruenba@redhat.com>
	<CAHc6FU5jgGGsHS9xRDMmssOH3rzDWoRYvrnDM5mHK1ASKc60yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc6FU5jgGGsHS9xRDMmssOH3rzDWoRYvrnDM5mHK1ASKc60yA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Mon, 29 Apr 2019 19:42:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 29 Apr 2019 19:42:46 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'newverein.lst.de'
	FROM:'hch@lst.de' RCPT:''
X-RedHat-Spam-Score: -0.01 (RCVD_IN_DNSWL_NONE) 213.95.11.211 verein.lst.de
	213.95.11.211 verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>, Mark Syms <Mark.Syms@citrix.com>,
	cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v6 1/4] iomap: Clean up
	__generic_write_end calling
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 29 Apr 2019 19:42:58 +0000 (UTC)

On Mon, Apr 29, 2019 at 07:46:29PM +0200, Andreas Gruenbacher wrote:
> On Mon, 29 Apr 2019 at 18:32, Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > From: Christoph Hellwig <hch@lst.de>
> >
> > Move the call to __generic_write_end into iomap_write_end instead of
> > duplicating it in each of the three branches.  This requires open coding
> > the generic_write_end for the buffer_head case.
> 
> Wouldn't it make sense to turn __generic_write_end into a void
> function? Right now, it just oddly return its copied argument.

Yes, we could remove the return value.  That should be a separate patch
after this one, though.

