Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 98467FD28
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Apr 2019 17:47:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 147A030842B0;
	Tue, 30 Apr 2019 15:47:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B06139F3A2;
	Tue, 30 Apr 2019 15:47:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CB893FB10;
	Tue, 30 Apr 2019 15:47:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UFlir1031085 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 11:47:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CCE0A62498; Tue, 30 Apr 2019 15:47:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A313E62482;
	Tue, 30 Apr 2019 15:47:42 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4190D402E;
	Tue, 30 Apr 2019 15:47:22 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x3UFiMc8138912; Tue, 30 Apr 2019 15:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=ORetv7bkfUVIk8T/lSppKI2JhxisrSy4qmjBLBLnjjU=;
	b=tvEDCQT1n9op9yMFG/x01to6k569aBRL49XaMOFPdv8GtdoR9uOUn0CPzDt97v32z2wp
	pUmhkFrsj/WbnsZMwWThi4kf2fNpqiEHCIlQUBcDuqXv+gN9TYHs4AAJz5M70TPdrnOQ
	B+tCGls+HJ6lQN7+eNEcI4lVtu3U22tYIvzfy0BX0MzFiQsEP9LI6eCzqH7XLzjc4z/a
	6heTrXV4DQhnSzlFy0u/bSzYweSqFFZ4q6gX5qOOi6t2HzDjj1PwrwEWzKoQ5xv2T8Gh
	shuAgbuZBKc6KnctZOUgKwfdD8vAG3P3XdeEMXpWkqaim5VZO3EsQI7W2fUnW0aNQk1U
	EQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2130.oracle.com with ESMTP id 2s4ckddnpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 15:47:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x3UFl1sv104991; Tue, 30 Apr 2019 15:47:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 2s5u512dx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2019 15:47:10 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3UFl8PZ025334;
	Tue, 30 Apr 2019 15:47:09 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 30 Apr 2019 08:47:08 -0700
Date: Tue, 30 Apr 2019 08:47:07 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190430154707.GG5200@magnolia>
References: <20190429220934.10415-1-agruenba@redhat.com>
	<20190429220934.10415-6-agruenba@redhat.com>
	<20190430153256.GF5200@magnolia>
	<CAHc6FU5hHFWeGM8+fhfaNs22cSG+wtuTKZcMMKbfeetg1CK4BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHc6FU5hHFWeGM8+fhfaNs22cSG+wtuTKZcMMKbfeetg1CK4BQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1904300096
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1904300097
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Tue, 30 Apr 2019 15:47:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 30 Apr 2019 15:47:38 +0000 (UTC) for IP:'141.146.126.79'
	DOMAIN:'aserp2130.oracle.com' HELO:'aserp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.465  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 141.146.126.79 aserp2130.oracle.com 141.146.126.79
	aserp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>, Mark Syms <Mark.Syms@citrix.com>,
	cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH v7 5/5] gfs2: Fix iomap write page
	reclaim deadlock
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 30 Apr 2019 15:47:49 +0000 (UTC)

On Tue, Apr 30, 2019 at 05:39:28PM +0200, Andreas Gruenbacher wrote:
> On Tue, 30 Apr 2019 at 17:33, Darrick J. Wong <darrick.wong@oracle.com> wrote:
> > On Tue, Apr 30, 2019 at 12:09:34AM +0200, Andreas Gruenbacher wrote:
> > > Since commit 64bc06bb32ee ("gfs2: iomap buffered write support"), gfs2 is doing
> > > buffered writes by starting a transaction in iomap_begin, writing a range of
> > > pages, and ending that transaction in iomap_end.  This approach suffers from
> > > two problems:
> > >
> > >   (1) Any allocations necessary for the write are done in iomap_begin, so when
> > >   the data aren't journaled, there is no need for keeping the transaction open
> > >   until iomap_end.
> > >
> > >   (2) Transactions keep the gfs2 log flush lock held.  When
> > >   iomap_file_buffered_write calls balance_dirty_pages, this can end up calling
> > >   gfs2_write_inode, which will try to flush the log.  This requires taking the
> > >   log flush lock which is already held, resulting in a deadlock.
> >
> > /me wonders how holding the log flush lock doesn't seriously limit
> > performance, but gfs2 isn't my fight so I'll set that aside and assume
> > that a patch S-o-B'd by both maintainers is ok. :)
> 
> This only affects inline and journaled data, not standard writes, so
> it's not quite as bad as it looks.

Ah, ok.

> > How should we merge this patch #5?  It doesn't touch fs/iomap.c itself,
> > so do you want me to pull it into the iomap branch along with the
> > previous four patches?  That would be fine with me (and easier than a
> > multi-tree merge mess)...
> 
> I'd prefer to get this merged via the gfs2 tree once the iomap fixes
> have been pulled.

Ok, I'll take the first four patches through the iomap branch and cc you
on the pull request.

--D

> 
> Thanks,
> Andreas

