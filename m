Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 416791705BA
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Feb 2020 18:13:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582737195;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3jIeLK/AeVjYjcHO1S7cLw+TWulI6FceP+ItZ0OLGhM=;
	b=dyCCb+PSOeS14H4Myc1D/epn+Xr8SDKZWm2H4HbkLzjjGTAUoCl0HHzJ/JIDrfQC60hTjR
	GvJzSPYZf/r0WcgS4nr+0kVZWmgbUptsBMshctR5UENDX7I/WKZs5mwufRS42C/bpedhvd
	1RekRqIoxfkhtNy812boXm2NLipQDks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-nAvLWITIPaW6tx2h_s70lA-1; Wed, 26 Feb 2020 12:13:13 -0500
X-MC-Unique: nAvLWITIPaW6tx2h_s70lA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFF17800D53;
	Wed, 26 Feb 2020 17:13:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A34FF100164D;
	Wed, 26 Feb 2020 17:13:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C4F48446D;
	Wed, 26 Feb 2020 17:13:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01QHD7We021929 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 12:13:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 903A8F9AA7; Wed, 26 Feb 2020 17:13:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BF2BF4D3B
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 17:13:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 681B385A339
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 17:13:05 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-378-Q1VxduaOOzSTTUMRaWXexA-1; Wed, 26 Feb 2020 12:13:03 -0500
X-MC-Unique: Q1VxduaOOzSTTUMRaWXexA-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01QHCatj193451; Wed, 26 Feb 2020 17:12:40 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 2ydct353mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2020 17:12:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01QGmHuR157882; Wed, 26 Feb 2020 17:10:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3020.oracle.com with ESMTP id 2ydcs5j8nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 26 Feb 2020 17:10:39 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01QHAdYU126581;
	Wed, 26 Feb 2020 17:10:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 2ydcs5j8me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2020 17:10:39 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01QHAcnt030079;
	Wed, 26 Feb 2020 17:10:38 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 26 Feb 2020 09:10:38 -0800
Date: Wed, 26 Feb 2020 09:10:36 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200226171036.GE8045@magnolia>
References: <20200225214838.30017-1-willy@infradead.org>
	<20200225214838.30017-26-willy@infradead.org>
	<20200226170425.GD8045@magnolia>
	<20200226170728.GD22837@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200226170728.GD22837@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9543
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	lowpriorityscore=0 bulkscore=0
	impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
	adultscore=0
	phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 clxscore=1015
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002260114
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01QHD7We021929
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v8 25/25] iomap: Convert from readpages
	to readahead
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 26, 2020 at 09:07:28AM -0800, Christoph Hellwig wrote:
> On Wed, Feb 26, 2020 at 09:04:25AM -0800, Darrick J. Wong wrote:
> > > @@ -456,15 +435,8 @@ iomap_readpages(struct address_space *mapping, s=
truct list_head *pages,
> > >  =09=09=09unlock_page(ctx.cur_page);
> > >  =09=09put_page(ctx.cur_page);
> > >  =09}
> > > -
> > > -=09/*
> > > -=09 * Check that we didn't lose a page due to the arcance calling
> > > -=09 * conventions..
> > > -=09 */
> > > -=09WARN_ON_ONCE(!ret && !list_empty(ctx.pages));
> > > -=09return ret;
> >=20
> > After all the discussion about "if we still have ctx.cur_page we should
> > just stop" in v7, I'm surprised that this patch now doesn't say much of
> > anything, not even a WARN_ON()?
>=20
> The code quoted above puts the cur_page reference.  By dropping the
> odd refactoring patch there is no need to check for cur_page being
> left as a special condition as that still is the normal loop exit
> state and properly handled, just as in the original iomap code.

DOH.  Yes, yes it does.  Thanks for pointing that out. :)

/me hands himself another cup of coffee,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D


