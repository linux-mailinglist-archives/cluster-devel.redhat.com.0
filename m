Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id B786818B2F2
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Mar 2020 13:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584619564;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v7zEP7RtOUJktHuCXePFovWTz/T8i1lu/X2pjX1Hbbo=;
	b=Tp6/ZoK46rkCDAVlfny2rEhShip7lsnAeQaddwtud2qH2kSL+Q0Io5BOAAt2/C5uMylCD3
	2PmPahmQ3aqgk5iW66ye5Y/zPe2e1hY/r2x395gHRnidKuxl/bT9B0j+slFz3FUfPepwlQ
	e7qvTZiqIKyg1Q8QCp1IM61HeFNsZVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333--RXVerC7OHaKMRT_dOKuSQ-1; Thu, 19 Mar 2020 08:06:03 -0400
X-MC-Unique: -RXVerC7OHaKMRT_dOKuSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3721E1084431;
	Thu, 19 Mar 2020 12:06:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEE7F5C1A2;
	Thu, 19 Mar 2020 12:05:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53F1918095FF;
	Thu, 19 Mar 2020 12:05:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02JBoK2d001529 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Mar 2020 07:50:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 45E7720316F9; Thu, 19 Mar 2020 11:50:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4058420316F0
	for <cluster-devel@redhat.com>; Thu, 19 Mar 2020 11:50:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FC71101A55E
	for <cluster-devel@redhat.com>; Thu, 19 Mar 2020 11:50:17 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-18-hSDzhqyDOsCrs7k0aIp_Mw-1; Thu, 19 Mar 2020 07:50:15 -0400
X-MC-Unique: hSDzhqyDOsCrs7k0aIp_Mw-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02JBgsVq127221; Thu, 19 Mar 2020 11:49:44 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 2yrpprfua2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Mar 2020 11:49:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02JBgha2113568; Thu, 19 Mar 2020 11:49:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3030.oracle.com with ESMTP id 2ys8rkw5nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 19 Mar 2020 11:49:43 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02JBngEO129865;
	Thu, 19 Mar 2020 11:49:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3030.oracle.com with ESMTP id 2ys8rkw5mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Mar 2020 11:49:42 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02JBnfQm014664;
	Thu, 19 Mar 2020 11:49:41 GMT
Received: from [192.168.0.110] (/73.243.10.6)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 19 Mar 2020 04:49:41 -0700
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: William Kucharski <william.kucharski@oracle.com>
In-Reply-To: <20200225214838.30017-1-willy@infradead.org>
Date: Thu, 19 Mar 2020 05:49:38 -0600
Message-Id: <09A89B86-9F2E-4829-9180-AA81320CE2FE@oracle.com>
References: <20200225214838.30017-1-willy@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	bulkscore=0
	suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
	clxscore=1011
	impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=768
	mlxscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003190054
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:05:57 -0400
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm <linux-mm@kvack.org>, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v8 00/25] Change readahead API
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit

For the series:

Reviewed-by: William Kucharski <william.kucharski@oracle.com>

