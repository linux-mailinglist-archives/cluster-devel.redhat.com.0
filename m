Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334E18164
	for <lists+cluster-devel@lfdr.de>; Wed,  8 May 2019 22:58:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDACAC05FF80;
	Wed,  8 May 2019 20:58:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3D0562699;
	Wed,  8 May 2019 20:58:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 929D241F58;
	Wed,  8 May 2019 20:58:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48KwNvO006251 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 16:58:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3305B600D4; Wed,  8 May 2019 20:58:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 105FB600CD;
	Wed,  8 May 2019 20:58:21 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F48130018C0;
	Wed,  8 May 2019 20:58:20 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7ADE6316;
	Wed,  8 May 2019 20:58:19 +0000 (UTC)
Date: Wed, 8 May 2019 14:58:18 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190508145818.6a53dff5@lwn.net>
In-Reply-To: <CAHc6FU40HucCUzx5k2obs8m6dXS08NmXBM-tFOq7fSbLduHiGw@mail.gmail.com>
References: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
	<CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
	<CAHk-=whbrADQrEezs=-t0QsKw-qaVU_2s2DqxLAkcczxc62SLQ@mail.gmail.com>
	<CAHc6FU40HucCUzx5k2obs8m6dXS08NmXBM-tFOq7fSbLduHiGw@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Wed, 08 May 2019 20:58:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Wed, 08 May 2019 20:58:20 +0000 (UTC) for IP:'45.79.88.28'
	DOMAIN:'ms.lwn.net' HELO:'ms.lwn.net' FROM:'corbet@lwn.net' RCPT:''
X-RedHat-Spam-Score: -0.011  (RCVD_IN_DNSWL_NONE,
	SPF_PASS) 45.79.88.28 ms.lwn.net 45.79.88.28 ms.lwn.net
	<corbet@lwn.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>, "Tobin C. Harding" <me@tobin.cc>
Subject: Re: [Cluster-devel] GFS2: Pull Request
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 08 May 2019 20:58:29 +0000 (UTC)

On Wed, 8 May 2019 22:17:12 +0200
Andreas Gruenbacher <agruenba@redhat.com> wrote:

> Would it make sense to describe how to deal with merge conflicts in
> Documentation/maintainer/pull-requests.rst to stop people from getting
> this wrong over and over again?

I think this certainly belongs in the maintainer manual, but probably not
in pull-requests.rst.  There are a lot of things about repository
management that seem to trip up even experienced maintainers; pre-pull
merges is just one of those.  I would love to see a proper guide on when
and how to do merges in general.

CCing Dan, who has ambitions for the maintainer manual as well, just in
case he has anything in mind here.

Thanks,

jon

