Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A949DEB05
	for <lists+cluster-devel@lfdr.de>; Mon, 29 Apr 2019 21:43:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 134AD356FF;
	Mon, 29 Apr 2019 19:43:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1CFA190C7;
	Mon, 29 Apr 2019 19:43:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC28A18089CB;
	Mon, 29 Apr 2019 19:43:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TJhYtT012996 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 15:43:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 610EA6B646; Mon, 29 Apr 2019 19:43:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2065F6C1E1;
	Mon, 29 Apr 2019 19:43:32 +0000 (UTC)
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BF713082E06;
	Mon, 29 Apr 2019 19:43:31 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id C021568AFE; Mon, 29 Apr 2019 21:43:14 +0200 (CEST)
Date: Mon, 29 Apr 2019 21:43:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190429194314.GB6138@lst.de>
References: <20190429163239.4874-1-agruenba@redhat.com>
	<20190429163239.4874-2-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429163239.4874-2-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Mon, 29 Apr 2019 19:43:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Mon, 29 Apr 2019 19:43:31 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'newverein.lst.de'
	FROM:'hch@lst.de' RCPT:''
X-RedHat-Spam-Score: -0.01 (RCVD_IN_DNSWL_NONE) 213.95.11.211 verein.lst.de
	213.95.11.211 verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>,
	Mark Syms <Mark.Syms@citrix.com>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v6 2/4] iomap: Fix use-after-free error
 in page_done callback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 29 Apr 2019 19:43:36 +0000 (UTC)

Or we could merge the dropping of the __generic_write_end return
value into this one if you prefer.

Either way:

Reviewed-by: Christoph Hellwig <hch@lst.de>

