Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D0DAD77
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Oct 2019 14:53:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDA5430833C1;
	Thu, 17 Oct 2019 12:53:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40228600C4;
	Thu, 17 Oct 2019 12:53:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3591F83542;
	Thu, 17 Oct 2019 12:53:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9HCkYC9029316 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Oct 2019 08:46:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3E6225D70D; Thu, 17 Oct 2019 12:46:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38FBC5D6C8
	for <cluster-devel@redhat.com>; Thu, 17 Oct 2019 12:46:31 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6EA769086
	for <cluster-devel@redhat.com>; Thu, 17 Oct 2019 12:46:30 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id a6so1063060otp.2
	for <cluster-devel@redhat.com>; Thu, 17 Oct 2019 05:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vaWTT7JqqW/omoel2Kh7+Tx9nZC4ZDq/vWAR367HkMc=;
	b=beo/3RItEUVdiM5HQLJbIbjFv34huEK+nzSmD/9VFuJShUo7xQGhXgXdlpJLQlwn/x
	aYK3tdXd25SANMZrTquT64AvuyD9WsmHsWS6eXG1GsjpVLmz7dyqQbpUHnPdxHzZMBGu
	5mu8BG8VVVyQQI2Z9BXjoPx3KGu7VlEYPkvLSOp7PXiid6cabUjEfvVGxYJ8ndOzMWaZ
	FAXL7vPcvZHu8gULMb83Paf+NpubZSzOFc7wZib1EOuTseAcUSQq7afmtg6MNTvB4k1N
	FJmGvILr6e08R7kjRsYzNZvsYJqyt184amzCEOqqBhwYNEOj8ywK1TG/e8s/RErZYSx0
	zxjw==
X-Gm-Message-State: APjAAAVryEcK6t/HJlFWFDhwbCrsq6CVj7ul9TwYciUX7OAHhtbKlYvf
	bnn5ukj6f5g+HaUUWbO/WoFNArfDLlHNNxZBeRycYmX/CHmJ34cTfUeCTCNPTjRZivTJs1bL3eE
	ws8/YTiI08HZN106jqi5a9hH7uh2GNXgu1Z/f/w==
X-Received: by 2002:a9d:578c:: with SMTP id q12mr2894079oth.185.1571316390466; 
	Thu, 17 Oct 2019 05:46:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqymPkeFxkVdqnQC5LbPy95EWMAssDeF/PPOZOqn+xXKlKhhjqCK4Yb0h5AV9GEqyNDK0ze/wDlm4K38c45cWow=
X-Received: by 2002:a9d:578c:: with SMTP id q12mr2894065oth.185.1571316390261; 
	Thu, 17 Oct 2019 05:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191017110225.30841-1-ben.dooks@codethink.co.uk>
	<25bb4857-950e-592a-b2ba-7730867742b3@redhat.com>
In-Reply-To: <25bb4857-950e-592a-b2ba-7730867742b3@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 17 Oct 2019 14:46:19 +0200
Message-ID: <CAHc6FU7V6PK4OhzqiELiG8cXi5jhpV7whe5Dx5jbL_69LxzUpg@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: linux-kernel@lists.codethink.co.uk,
	cluster-devel <cluster-devel@redhat.com>,
	"Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: make gfs2_fs_parameters static
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 17 Oct 2019 12:53:32 +0000 (UTC)

On Thu, Oct 17, 2019 at 1:42 PM Andrew Price <anprice@redhat.com> wrote:
> On 17/10/2019 12:02, Ben Dooks (Codethink) wrote:
> > The gfs2_fs_parameters is not used outside the unit
> > it is declared in, so make it static.
> >
> > Fixes the following sparse warning:
> >
> > fs/gfs2/ops_fstype.c:1331:39: warning: symbol 'gfs2_fs_parameters' was not declared. Should it be static?
> >
> > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > ---
> > Cc: Bob Peterson <rpeterso@redhat.com>
> > Cc: Andreas Gruenbacher <agruenba@redhat.com>
> > Cc: cluster-devel@redhat.com
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >   fs/gfs2/ops_fstype.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> > index 681b44682b0d..ebdef1c5f580 100644
> > --- a/fs/gfs2/ops_fstype.c
> > +++ b/fs/gfs2/ops_fstype.c
> > @@ -1328,7 +1328,7 @@ static const struct fs_parameter_enum gfs2_param_enums[] = {
> >       {}
> >   };
> >
> > -const struct fs_parameter_description gfs2_fs_parameters = {
> > +static const struct fs_parameter_description gfs2_fs_parameters = {
> >       .name = "gfs2",
> >       .specs = gfs2_param_specs,
> >       .enums = gfs2_param_enums,
> >
>
> Looks good to me.

Andy, I've added a reviewed-by tag for you and pushed this to for-next.

Thanks,
Andreas

