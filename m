Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 69506119642
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Dec 2019 22:26:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576013181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OpaISYHgn6PsWGMR75+8flEmu8NVdYmIGEIqWqTcx1U=;
	b=N3vzVQB2VTP0aziK5GjcYfICRGSzG4Ybz1O0Kxrd/T4arSFCEdLf+HJNg4CyQTwHcCHKvJ
	kVD9IONwHzMlWc/f1/UOUWipYEkyyU+/76sci1q6Hu4QctPr+gxIxrKLEam4izlSrDKGgE
	4d/fAxvSvLa5OmsPHnXkgSxKyKfwcN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-XumYbhVcMxmssXdIAIcIpA-1; Tue, 10 Dec 2019 16:26:19 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FE74477;
	Tue, 10 Dec 2019 21:26:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E68F5D9C5;
	Tue, 10 Dec 2019 21:26:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DBD918095FF;
	Tue, 10 Dec 2019 21:26:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBALQCda016495 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Dec 2019 16:26:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 74019F89EE; Tue, 10 Dec 2019 21:26:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E54CF9AAA
	for <cluster-devel@redhat.com>; Tue, 10 Dec 2019 21:26:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79F0E90780B
	for <cluster-devel@redhat.com>; Tue, 10 Dec 2019 21:26:07 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-367--KNeNVzgMeKnXHxfIFuh-A-1; Tue, 10 Dec 2019 16:26:05 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	xBALP42H085099; Tue, 10 Dec 2019 21:25:54 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 2wr41q8w2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2019 21:25:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	xBALLnFo141716; Tue, 10 Dec 2019 21:25:54 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 2wt6bdwp09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2019 21:25:53 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBALPrXC020312;
	Tue, 10 Dec 2019 21:25:53 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 Dec 2019 13:25:53 -0800
Date: Tue, 10 Dec 2019 13:25:52 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <20191210212552.GC99875@magnolia>
References: <20191210102916.842-1-agruenba@redhat.com>
	<20191210203252.GA99875@magnolia>
	<CAHpGcMJMgttnXu48wHnP-WqdPkuXBaFd+COKV9XiRP6VrtRUVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHpGcMJMgttnXu48wHnP-WqdPkuXBaFd+COKV9XiRP6VrtRUVg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9467
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1911140001 definitions=main-1912100176
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9467
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
	definitions=main-1912100177
X-MIME-Autoconverted: from 8bit to quoted-printable by aserp2120.oracle.com id
	xBALP42H085099
X-MC-Unique: -KNeNVzgMeKnXHxfIFuh-A-1
X-MC-Unique: XumYbhVcMxmssXdIAIcIpA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBALQCda016495
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] iomap: Export iomap_page_create and
 iomap_set_range_uptodate
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Dec 10, 2019 at 09:39:31PM +0100, Andreas Gr=FCnbacher wrote:
> Am Di., 10. Dez. 2019 um 21:33 Uhr schrieb Darrick J. Wong
> <darrick.wong@oracle.com>:
> > On Tue, Dec 10, 2019 at 11:29:16AM +0100, Andreas Gruenbacher wrote:
> > > These two functions are needed by filesystems for converting inline
> > > ("stuffed") inodes into non-inline inodes.
> > >
> > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> >
> > Looks fine to me... this is a 5.6 change, correct?
>=20
> Yes, so there's still plenty of time to get things in place until
> then. I'd like to hear from Christoph if he has any objections. In any
> case, this patch isn't going to break anything.

By the way, the other symbols in fs/iomap/ are all EXPORT_SYMBOL_GPL.
Does gfs2/RH/anyone have a particular requirement for EXPORT_SYMBOL, or
could we make the new exports _GPL to match the rest?

--D

> Thanks,
> Andreas


