Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 38369391BF8
	for <lists+cluster-devel@lfdr.de>; Wed, 26 May 2021 17:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622042860;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jhOIFv3A+gFZ1ZYDYjGlbPcVSgvp6hLiKt+ZLbMGNc0=;
	b=Iu7LilJWwYjawYkBdtqb7VXdDhkxcNVZCCcsn+W7WGjp+U0c+Z4jCgHlYt+CF/MavD7sed
	Ee/9y0kcdtiEB92haMR1x1udHVArO63PBdLR80ASrpXl4BdmSx+nOuC7RMrxJoyXI7XU20
	oRqY182wVe0tB68dbVlZAHh93t3ehkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-NQWF1HvGPzKidYmEvoC2Ow-1; Wed, 26 May 2021 11:27:38 -0400
X-MC-Unique: NQWF1HvGPzKidYmEvoC2Ow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA666C745A;
	Wed, 26 May 2021 15:27:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D633100AE43;
	Wed, 26 May 2021 15:27:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 045D21800BB8;
	Wed, 26 May 2021 15:27:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14QFL7ED002343 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 11:21:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EEC05103CCA; Wed, 26 May 2021 15:21:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9409103CA7
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 15:21:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BE4180D0E1
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 15:21:04 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-199-KZ0BF_p8N9OGTOKl3BklkA-1; Wed, 26 May 2021 11:21:02 -0400
X-MC-Unique: KZ0BF_p8N9OGTOKl3BklkA-1
Received: by mail-io1-f70.google.com with SMTP id
	n190-20020a6b8bc70000b029048dae3d75dbso302819iod.11
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 08:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jhOIFv3A+gFZ1ZYDYjGlbPcVSgvp6hLiKt+ZLbMGNc0=;
	b=NaWF3t91ul+o7iYQTysIPvTJGvkiRgINFI5gNqKx7fShIsMrNdYRbS9XFcTCTjsi11
	hGFcocOPFFULmV+hWmD6h+PAMaRornSP0mvkFxQQ8qS/yHTlSIqLJrLejWgXtmoY+PZD
	YBes4xeSk/dGsdjV/+oMNz5mNr8YzAYryYUFNYZzRmE8ADl78fXtydGHwhYrVlEdmLZs
	zoNFGFBtZ9QWhjkjm9M1kHICiyz2PLCK/Yr2INNE8m0l6XoaSFWAnaftSxoJEqTkIowZ
	l+zbVYSZduE8aseb5Jrl8oyccb0+kd3kPIYKB0XwlBM3mhtU+idUTBR6qMG6bbNe9OMW
	uDcg==
X-Gm-Message-State: AOAM531FWnH/fte+ImhjkfGUDYRJH7yBJWu1ls9Ga5YLDsXqgjd/MnOC
	Wgjnxg/n6mq2aJoC7uSHghMWI8ST0nMWkXPa/TJcjZibrx7E+iUAV2D1YSdR+k+rnQctol4nmI1
	wZx61xeKJE77DJ3uQr5fbWpjl9OGgoFw9yoIRgA==
X-Received: by 2002:a05:6e02:1d0b:: with SMTP id
	i11mr24256287ila.36.1622042460413; 
	Wed, 26 May 2021 08:21:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEKbed0DX67gVAvzGue1bRlEWADWz+24eEBz0gGrbWLbxNSJGaqoPhH9p8Z8PekwUtY1O0CahhhQjIjoFqqeg=
X-Received: by 2002:a05:6e02:1d0b:: with SMTP id
	i11mr24256272ila.36.1622042460214; 
	Wed, 26 May 2021 08:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <202105260504.vtgCtU72-lkp@intel.com>
In-Reply-To: <202105260504.vtgCtU72-lkp@intel.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Wed, 26 May 2021 11:20:49 -0400
Message-ID: <CAK-6q+hsBK9xYbqCkmgajXE87qa8FF9413ton6FojQ2n63sBnQ@mail.gmail.com>
To: kernel test robot <lkp@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org
Subject: Re: [Cluster-devel] [dlm:next 14/16] fs/dlm/midcomms.c:541:25:
 sparse: sparse: cast to restricted __le32
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

before somebody tried to fix it. Some comments, see below.

On Tue, May 25, 2021 at 5:17 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git next
> head:   706474fbc5fedd7799b488962aad3541b235165b
> commit: 489d8e559c6596eb08e16447d9830bc39afbe54e [14/16] fs: dlm: add reliable connection if reconnect
> config: m68k-randconfig-s031-20210525 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git/commit/?id=489d8e559c6596eb08e16447d9830bc39afbe54e
>         git remote add dlm https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git
>         git fetch --no-tags dlm next
>         git checkout 489d8e559c6596eb08e16447d9830bc39afbe54e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=m68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
> >> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
> >> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
> >> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
> >> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
> >> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
> >> fs/dlm/midcomms.c:541:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:634:19: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:634:19: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:634:19: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:634:19: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:636:16: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:636:16: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:636:16: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:636:16: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:674:27: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:674:27: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:674:27: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:674:27: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:693:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:703:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:712:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:722:42: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:722:42: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:722:42: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:722:42: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:725:26: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:725:26: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:725:26: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:725:26: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:760:23: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:794:27: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:794:27: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:794:27: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:794:27: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:854:26: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:854:26: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:854:26: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:854:26: sparse: sparse: cast to restricted __le16
>    fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:868:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32
>    fs/dlm/midcomms.c:876:25: sparse: sparse: cast to restricted __le32

We can ignore it for now. The dlm code does some endian transfer with
cpu_to_leFOO() and vice versa and never uses any __leFOO define. See
header_in()/out() functions. Sure somebody is welcome to send patches
and make sparse happy but it requires more code changes.

> >> fs/dlm/midcomms.c:969:20: sparse: sparse: context imbalance in 'dlm_midcomms_get_mhandle' - wrong count at exit
>    fs/dlm/midcomms.c:1045:33: sparse: sparse: context imbalance in 'dlm_midcomms_commit_mhandle' - unexpected unlock
>

That is false positive, we always assume a successful get_mhandle()
triggers a commit_mhandle() and we keep the srcu nodes locked so that
a reference isn't be freed, avoiding an extra lookup. There is also no
logic to revert an allocated buffer, the complicated part will be to
rearrange the buffer in the page buffer then which seems to be quite
complex, so if there is a get_mhandle() there must be a
commit_mhandle(). That was always be the case.

- Alex

