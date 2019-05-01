Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 935E3109CA
	for <lists+cluster-devel@lfdr.de>; Wed,  1 May 2019 17:07:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6810D81106;
	Wed,  1 May 2019 15:07:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6669C18243;
	Wed,  1 May 2019 15:07:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0650F41F3D;
	Wed,  1 May 2019 15:07:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x41F781r008254 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 1 May 2019 11:07:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3E941799B; Wed,  1 May 2019 15:07:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A2EF8176F;
	Wed,  1 May 2019 15:07:06 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBDCB3082AC3;
	Wed,  1 May 2019 15:06:51 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x41ExMG3168304; Wed, 1 May 2019 15:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=Q8eGFCnQ0LTZ5owUi28FCcA36LPqeTtkuqRUrAAOMqQ=;
	b=QPg18rZz1fDX726lTOySzky3amPtJJUw6SD7G0DDF5/b/Q8BdfUVQdFCD+qjAme3MQBQ
	35uCtb22qCOLQsVnPL8Ne9MPtoTpPCoyJxKtSc2M2NvnV3p/QGMJl5AQPD1om2PPT0l1
	wLm3GwTRyF/HTKS8nMrL3+md+IPUgf4sv1xtXb74snMNqeqmo9A0IBTVc1hhot5M7bvX
	QIxWFgDF39qDaWsa89ROith7S4en1arnd4ozOqg+ZgtrVQnPjLiTjHkZHu7kk7ESdMLO
	qEqxPLDUG6Z7zFPwzHyIF4OVPK/7qpNOe1HQxzLTRhOmrT3XQK2AgEdjKaM0+A7ki+st
	yA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2130.oracle.com with ESMTP id 2s6xhyb4wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 May 2019 15:06:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x41F535g143581; Wed, 1 May 2019 15:06:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 2s6xhgj8bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 May 2019 15:06:41 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x41F6cto020498;
	Wed, 1 May 2019 15:06:38 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 01 May 2019 08:06:38 -0700
Date: Wed, 1 May 2019 08:06:37 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20190501150637.GG5217@magnolia>
References: <20190429220934.10415-1-agruenba@redhat.com>
	<20190430025028.GA5200@magnolia>
	<20190430212146.GL1454@dread.disaster.area>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430212146.GL1454@dread.disaster.area>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1905010096
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1905010096
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Wed, 01 May 2019 15:07:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Wed, 01 May 2019 15:07:02 +0000 (UTC) for IP:'141.146.126.79'
	DOMAIN:'aserp2130.oracle.com' HELO:'aserp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.465  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 141.146.126.79 aserp2130.oracle.com 141.146.126.79
	aserp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 01 May 2019 15:07:21 +0000 (UTC)

On Wed, May 01, 2019 at 07:21:46AM +1000, Dave Chinner wrote:
> On Mon, Apr 29, 2019 at 07:50:28PM -0700, Darrick J. Wong wrote:
> > On Tue, Apr 30, 2019 at 12:09:29AM +0200, Andreas Gruenbacher wrote:
> > > Here's another update of this patch queue, hopefully with all wrinkles
> > > ironed out now.
> > > 
> > > Darrick, I think Linus would be unhappy seeing the first four patches in
> > > the gfs2 tree; could you put them into the xfs tree instead like we did
> > > some time ago already?
> > 
> > Sure.  When I'm done reviewing them I'll put them in the iomap tree,
> > though, since we now have a separate one. :)
> 
> I'd just keep the iomap stuff in the xfs tree as a separate set of
> branches and merge them into the XFS for-next when composing it.
> That way it still gets plenty of test coverage from all the XFS
> devs and linux next without anyone having to think about.
> 
> You really only need to send separate pull requests for the iomap
> and XFS branches - IMO, there's no really need to have a complete
> new tree for it...

<nod> That was totally a braino on my part -- I put the patches in the
iomap *branch* since now we have a separate *branch*. :)

(and just merged that branch into for-next)

--D

> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com

