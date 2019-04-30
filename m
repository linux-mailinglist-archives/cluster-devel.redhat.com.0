Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CDDEEDE
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 04:52:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14C32306E5FB;
	Tue, 30 Apr 2019 02:52:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 951786C50D;
	Tue, 30 Apr 2019 02:52:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5151518089CB;
	Tue, 30 Apr 2019 02:52:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3U2p4sO027652 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 22:51:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8288428D3F; Tue, 30 Apr 2019 02:51:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C9EA28DD5;
	Tue, 30 Apr 2019 02:51:02 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B628A8552A;
	Tue, 30 Apr 2019 02:50:42 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x3U2hrVn113580; Tue, 30 Apr 2019 02:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=7f8at92urxBnhxmK5RisQak2n2RS9MsVx744PF44sMk=;
	b=tEOHWepsllY8/YH2O39+c80pQXQZormVpmCTu6IN1mkJdkXLA4j9hQfcJj3BkSMIO5pb
	z+0zYJD4l84BmJDCrvvvmdkcduQR6n6wAnUjgiAchCrTbtPE2GuOfxPP+0LqJ+3LaUO7
	cgmMpp+EKqCtDQZsZ508qywYwdOY8DaD5lf3vOfzoziE7QOTj5UYPWahChumAzhcYOX1
	xrDyrKV/KJ0rBD2DAso8InNIlQFwqLrsiPEcsAMe4PPrvaw36c4RMrpNsSwVAfUVmp9i
	tobttfcBOUbFm6eFpQWVdhr8bt1sGfZIxu/a66N1MYqq33HwVfzxgwpWhT9ZvkaavTdX
	HQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 2s4fqq1r0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 02:50:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x3U2mjab127419; Tue, 30 Apr 2019 02:50:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3030.oracle.com with ESMTP id 2s4d4a8xuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 02:50:34 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3U2oUIM027571;
	Tue, 30 Apr 2019 02:50:30 GMT
Received: from localhost (/10.159.138.192)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 29 Apr 2019 19:50:30 -0700
Date: Mon, 29 Apr 2019 19:50:28 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190430025028.GA5200@magnolia>
References: <20190429220934.10415-1-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429220934.10415-1-agruenba@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1904300017
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1904300017
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Tue, 30 Apr 2019 02:50:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Tue, 30 Apr 2019 02:50:58 +0000 (UTC) for IP:'156.151.31.85'
	DOMAIN:'userp2120.oracle.com' HELO:'userp2120.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.465  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.85 userp2120.oracle.com 156.151.31.85
	userp2120.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 30 Apr 2019 02:52:24 +0000 (UTC)

On Tue, Apr 30, 2019 at 12:09:29AM +0200, Andreas Gruenbacher wrote:
> Here's another update of this patch queue, hopefully with all wrinkles
> ironed out now.
> 
> Darrick, I think Linus would be unhappy seeing the first four patches in
> the gfs2 tree; could you put them into the xfs tree instead like we did
> some time ago already?

Sure.  When I'm done reviewing them I'll put them in the iomap tree,
though, since we now have a separate one. :)

--D

> Thanks,
> Andreas
> 
> Andreas Gruenbacher (4):
>   fs: Turn __generic_write_end into a void function
>   iomap: Fix use-after-free error in page_done callback
>   iomap: Add a page_prepare callback
>   gfs2: Fix iomap write page reclaim deadlock
> 
> Christoph Hellwig (1):
>   iomap: Clean up __generic_write_end calling
> 
>  fs/buffer.c           |   8 ++--
>  fs/gfs2/aops.c        |  14 ++++--
>  fs/gfs2/bmap.c        | 101 ++++++++++++++++++++++++------------------
>  fs/internal.h         |   2 +-
>  fs/iomap.c            |  55 ++++++++++++++---------
>  include/linux/iomap.h |  22 ++++++---
>  6 files changed, 124 insertions(+), 78 deletions(-)
> 
> -- 
> 2.20.1
> 

