Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 798571ADD43
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Apr 2020 14:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587126218;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XSYwu8zGtXxJmRFvQwTpNm2p8xUn9BQzbscu0BHWxnU=;
	b=bIbwbjxZH7QXYTDlEeMj33FOS7sc8maYP54PtepZO7ippNiTWQJ1PmG/WZWc3jlyUGo5Hk
	avmyXXOYT4dYAs//om3gHfO3FggrdIMErI8ZegnW5Pb/1iu1a/boa8rZXno9WYbOw+IhiL
	dCzBpQS73nYFlHuKkp3nCNot4rmwCjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-vpSX7cigMW2VSoMrZwp8fQ-1; Fri, 17 Apr 2020 08:23:36 -0400
X-MC-Unique: vpSX7cigMW2VSoMrZwp8fQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0F87802561;
	Fri, 17 Apr 2020 12:23:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D8BD60BE0;
	Fri, 17 Apr 2020 12:23:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F10819350C;
	Fri, 17 Apr 2020 12:23:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HCNJo7026473 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 08:23:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A70362026D69; Fri, 17 Apr 2020 12:23:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A38262026983
	for <cluster-devel@redhat.com>; Fri, 17 Apr 2020 12:23:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DFDA101A55E
	for <cluster-devel@redhat.com>; Fri, 17 Apr 2020 12:23:17 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
	[209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-375-M-c9nwlOMsKnEbcEbJZ_yA-1; Fri, 17 Apr 2020 08:23:15 -0400
X-MC-Unique: M-c9nwlOMsKnEbcEbJZ_yA-1
Received: by mail-ot1-f71.google.com with SMTP id 41so1645346otj.11
	for <cluster-devel@redhat.com>; Fri, 17 Apr 2020 05:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2gHPk6IxEXnKydntHUWTyklfOeUDa/xAoYl6tEazhAo=;
	b=bYPaBaVHJZqClCIUZiJtfdVQBKQnfWRdBVZEImj//BWMYQ+GD7dTqeU7W38nBVKW77
	5m9krCiYcHfFJL0SRpp3v8HVWApnpHwDSJrIrqqgPVlr+RW3/gZd8BS2wWFp1tCGdW7i
	WD/KAEUS2yElVk6rK3KEr8AH7mIz6CBdGWM5+UMclYtHXNX70aAc2+b98VAnkSsikVR5
	iiaFNAt2GfrzIOnanjecA2jAla/HL8KXUSuUV1wgk8xxavmQRsnidF/K566h7SKsI0yU
	x9Xx/eVs2S6D1GgaCO4KVoh5vVHIKqYP5b3vsVw3hGVPJZHaGXktPFsxe7xFKPviXG9P
	bdag==
X-Gm-Message-State: AGi0PuZx4dOMAMXGq6gHBhq82+JUpKvNJUpkvVw4i7BaOR/a1eRiqZwW
	rlzMrZ2eSNdOcuPAP/Q5m9b+DEtyKZaVROwQz+tbxKefSZ/WTLqrIolx6vjB5GK3yC3oChbnrti
	EovA2DWwIx6UDbzism5jM5BmiltMYeb07p+nfxw==
X-Received: by 2002:aca:61d4:: with SMTP id v203mr1950557oib.72.1587126194353; 
	Fri, 17 Apr 2020 05:23:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypK+vIBc8WJniD/K2UPbk1bZmxcm4QnC9MJv90XPGTapMNyvJW1WDoC+sz5H0a3IBYXciIt10Z1SoBqRtsfI4SI=
X-Received: by 2002:aca:61d4:: with SMTP id v203mr1950548oib.72.1587126194143; 
	Fri, 17 Apr 2020 05:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <202004171521.Z9s8gKSV%lkp@intel.com>
In-Reply-To: <202004171521.Z9s8gKSV%lkp@intel.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 17 Apr 2020 14:23:02 +0200
Message-ID: <CAHc6FU43LpVbPEEq29cDkJ5X2t=6qACfoETw15QZX1CHKqPUbQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03HCNJo7026473
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [gfs2:gfs2-iopen 12/12] fs/gfs2/util.c:126:3:
 error: implicit declaration of function 'gfs2_glock_dq_wait';
 did you mean 'gfs2_glock_nq_init'?
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bob,

On Fri, Apr 17, 2020 at 9:37 AM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.g=
it gfs2-iopen
> head:   c748e1ec9bd20d71265a148042f6bc97ffc5f343
> commit: c748e1ec9bd20d71265a148042f6bc97ffc5f343 [12/12] gfs2: Remove unu=
sed function gfs2_glock_dq_wait
> config: s390-defconfig (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout c748e1ec9bd20d71265a148042f6bc97ffc5f343
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross=
 ARCH=3Ds390
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    fs/gfs2/util.c: In function 'signal_our_withdraw':
> >> fs/gfs2/util.c:126:3: error: implicit declaration of function 'gfs2_gl=
ock_dq_wait'; did you mean 'gfs2_glock_nq_init'? [-Werror=3Dimplicit-functi=
on-declaration]
>      126 |   gfs2_glock_dq_wait(&sdp->sd_journal_gh);
>          |   ^~~~~~~~~~~~~~~~~~
>          |   gfs2_glock_nq_init
>    cc1: some warnings being treated as errors

commit "gfs2: Force withdraw to replay journals and wait for it to
finish" adds three new users of gfs2_glock_dq_wait in function
signal_our_withdraw. Is the waiting there done for a reason, or can we
replace gfs2_glock_dq_wait with gfs2_glock_dq / gfs2_glock_dq_uninit
in that function?

Thanks,
Andreas


