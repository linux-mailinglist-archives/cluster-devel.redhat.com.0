Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE14B50CC
	for <lists+cluster-devel@lfdr.de>; Tue, 17 Sep 2019 16:54:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 586153090FC2;
	Tue, 17 Sep 2019 14:54:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B6656012C;
	Tue, 17 Sep 2019 14:54:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 326AA18089C8;
	Tue, 17 Sep 2019 14:54:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8HEscfb008250 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 10:54:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C13625C1D8; Tue, 17 Sep 2019 14:54:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD1425C219
	for <cluster-devel@redhat.com>; Tue, 17 Sep 2019 14:54:38 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4285C056807
	for <cluster-devel@redhat.com>; Tue, 17 Sep 2019 14:54:38 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id x9so6139185ior.9
	for <cluster-devel@redhat.com>; Tue, 17 Sep 2019 07:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pQjdiFlrB/k9oRu1q6tr66ZBG0mijouSFGoFNbiqZpc=;
	b=WVkHP/mCWeQCCHcSILdIKUUUHERVcHLuu+boiLTOSOm+PXdYUo72es+0CGoWcPmUQh
	De8KHyOe1PuhKFrYd2+1U+1p2uZo2/fi9fv8Q2rwbuoWxNg8z8PNCBCavTcePupxBW4x
	qvcXrAd3FNPCIHWQvGAxDyTEA1Uno815+/J7xroOx0VFPyifO+68FdpV0SKfasq+z87Q
	mMa7gdqkrMh0cFGet8oRkZzvTNExlboeG59uhoX+ZYVSOWxvuNI5SrlUib4sSD7fWESr
	afOEp2vZMU3x7sKoUfppv5AkSPEkH276psXB7OohQ+KdK9MWo4MQXftQzoSidkIN+sqN
	Lx2w==
X-Gm-Message-State: APjAAAWk7XEpNNbKhtzVLNnujA+cxN3qqxlh/omjqNM1cZqc27xuX9Xc
	CYw/1pb0XycqbVlDNrgJT6QGhi8uIapXbtgoZGNINZJqTXMkrCxiONu61jXbqHzSs04Q62J3V5E
	auinqZIt4pIhP7BiIuQEviM96rpgbggeUqA/PFg==
X-Received: by 2002:a6b:591a:: with SMTP id n26mr3921980iob.74.1568732071792; 
	Tue, 17 Sep 2019 07:54:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyJxoOGL6/J0/rFtKVURUaPuYNTvfydU1aQ70Rj7rnqOLqb/euvzGjlSAUBZZ1d8ZDbcvOel/BgNogVxlToTNo=
X-Received: by 2002:a6b:591a:: with SMTP id n26mr3921723iob.74.1568732068392; 
	Tue, 17 Sep 2019 07:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <286915608.14310402.1568310826345.JavaMail.zimbra@redhat.com>
	<1757584015.14310422.1568310867058.JavaMail.zimbra@redhat.com>
In-Reply-To: <1757584015.14310422.1568310867058.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 17 Sep 2019 16:54:17 +0200
Message-ID: <CAHc6FU6mFCC6g7vGmiW6bL2u6k0PZ0=jdOWchyQ200+_4z5qYg@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: clear buf_in_tr when ending
 a transaction in sweep_bh_for_rgrps
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 17 Sep 2019 14:54:47 +0000 (UTC)

On Thu, Sep 12, 2019 at 7:59 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Hi,
>
> In function sweep_bh_for_rgrps, which is a helper for punch_hole,
> it uses variable buf_in_tr to keep track of when it needs to commit
> pending block frees on a partial delete that overflows the
> transaction created for the delete. The problem is that the
> variable was initialized at the start of function sweep_bh_for_rgrps
> but it was never cleared, even when starting a new transaction.
>
> This patch reinitializes the variable when the transaction is
> ended, so the next transaction starts out with it cleared.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>

I've put this onto for-next for the current merge window.

Thanks,
Andreas

