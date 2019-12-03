Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8698D111CF4
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Dec 2019 23:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575413391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bAUXTO90hdtlyzyt5VQe7mPqxu2W+q6e14/XrBlUsKM=;
	b=Iikc/emxnIsu9/ktrs1sRMHUMjxeNrnI/Mz+QNrKvr37db9XqgcpAocsgDIbnUfyQCW7+9
	xlLFqTpmxYQpjPWwsCvQLhoCbNbd6nn0X+pEaHHbfL1w0Acm4CKw5rB//dDaQ3iwsrGnlq
	qF3K+v+GpBLCbxy1bIvnhXVoPBeYvr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-U-_vBN2FMS2NIZa6_Vbc5g-1; Tue, 03 Dec 2019 17:49:50 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B0BC801E70;
	Tue,  3 Dec 2019 22:49:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4C6C60BE0;
	Tue,  3 Dec 2019 22:49:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B6FE1CAA;
	Tue,  3 Dec 2019 22:49:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB3MneB4023215 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 17:49:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D37601013EED; Tue,  3 Dec 2019 22:49:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDF4D101505A
	for <cluster-devel@redhat.com>; Tue,  3 Dec 2019 22:49:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC03C8E317F
	for <cluster-devel@redhat.com>; Tue,  3 Dec 2019 22:49:38 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-79-eU5y8PQNP9awYKEVtK6qiA-1; Tue, 03 Dec 2019 17:49:34 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	xB3MY79D110765; Tue, 3 Dec 2019 22:49:21 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 2wkh2raqfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Dec 2019 22:49:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	xB3MYHoO082700; Tue, 3 Dec 2019 22:49:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3020.oracle.com with ESMTP id 2wnvqx4r8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Dec 2019 22:49:20 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xB3MnHeU021188;
	Tue, 3 Dec 2019 22:49:17 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 03 Dec 2019 14:49:17 -0800
Date: Tue, 3 Dec 2019 14:49:15 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20191203224915.GK7335@magnolia>
References: <20191203160856.GC7323@magnolia>
	<CAHk-=wh3vin7WyMpBGWxZovGp51wa=U0T=TXqnQPVMBiEpdvsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wh3vin7WyMpBGWxZovGp51wa=U0T=TXqnQPVMBiEpdvsQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9460
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1911140001 definitions=main-1912030165
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9460
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
	definitions=main-1912030165
X-MC-Unique: eU5y8PQNP9awYKEVtK6qiA-1
X-MC-Unique: U-_vBN2FMS2NIZa6_Vbc5g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB3MneB4023215
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Dave Chinner <david@fromorbit.com>, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, Eric Sandeen <sandeen@sandeen.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [GIT PULL] iomap: small cleanups for 5.5
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Dec 03, 2019 at 01:21:01PM -0800, Linus Torvalds wrote:
> On Tue, Dec 3, 2019 at 8:09 AM Darrick J. Wong <djwong@kernel.org> wrote:
> > Please pull this series containing some more new iomap code for 5.5.
> > There's not much this time -- just removing some local variables that
> > don't need to exist in the iomap directio code.
>=20
> Hmm. The tag message (which was also in the email thanks to git
> request-pull) is very misleading.
>=20
> Pulled, but please check these things.

Sorry about that sloppiness, I'll avoid that in the future.

--D

>            Linus


